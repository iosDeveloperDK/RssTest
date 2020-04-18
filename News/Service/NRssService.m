//
//  NRssService.m
//  News
//
//  Created by Admin on 17/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import "NRssService.h"
#import "NRequestService.h"
#import "NXMLParser.h"
#import "NConstants.h"

@interface NRssService ()
@property(nonatomic, strong)NSArray* sources;
@property(nonatomic, copy)RssBlock fetchBlock;
@end

@implementation NRssService

- (instancetype)init
{
  self = [super init];
  if (self) {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateRSS) name:NOTIFICATION_FETCH_KEY object:nil];
  }
  return self;
}

-(void)rssRead:(NSArray<SourceModel*>*)sources completionBlock:(RssBlock)block {
  self.sources = sources;
  self.fetchBlock = block;
  [self updateRSS];
}

-(void)updateRSS {
  __block NSError* error = nil;
  NSMutableArray* models = [NSMutableArray new];
  NRequestService* request = [[NRequestService alloc] initService];
  dispatch_group_t serviceGroup = dispatch_group_create();

  for (SourceModel* source in self.sources) {
    if ([source isEnabled]) {
      dispatch_group_enter(serviceGroup);
      [request requestWithURL:source.url completionBlock:^(NSData * _Nonnull data, NSError * _Nonnull fetchError) {
        NSArray* xmlData = [NXMLParser modelsForXMLData:data];
        
        for (NSMutableDictionary* xml in xmlData) {
          xml[SOURCE_OBJECT_KEY] = source;
          [models addObject:xml];
        }
        
        if (!error && fetchError) {
          error = fetchError;
        }
        
        dispatch_group_leave(serviceGroup);
      }];
    }
  }
  
  dispatch_group_notify(serviceGroup,dispatch_get_main_queue(),^{
    self.fetchBlock(models, error);
  });
}

- (void)dealloc {
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
