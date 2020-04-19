//
//  NewsInteractor.m
//  News
//
//  Created by Admin on 16/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import "NewsInteractor.h"
#import "NRssService.h"
#import "NSourceReader.h"
#import "NXMLParser.h"
#import "NNewsDataBaseService.h"

@interface NewsInteractor ()
@property(nonatomic, strong)NRssService* rss;
@property(nonatomic, strong)NNewsDataBaseService* db;
@end

@implementation NewsInteractor

- (instancetype)init {
  self = [super init];
  _rss = [NRssService new];
  _db = [NNewsDataBaseService new];
  return self;
}

-(void)fetchData:(NewsCompletionBlock)block; {
  __weak typeof(self)weakSelf = self;
  [self.rss rssRead:[NSourceReader getSources] completionBlock:^(NSArray * _Nonnull models, NSError * _Nonnull error) {
    __strong typeof(self)self = weakSelf;
    for (NSDictionary* model in models) {
      [self.db appendNews:model];
    }
    block(models, error);
  }];
}

-(void)readNews:(News*)news {
  NNewsDataBaseService* db = [NNewsDataBaseService new];
  [db readNews:news];
}

@end
