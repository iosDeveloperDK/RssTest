//
//  NNewsDataBaseService.m
//  News
//
//  Created by Admin on 17/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import "NNewsDataBaseService.h"
#import "NSString+Formatter.h"
#import "NConstants.h"

@implementation NNewsDataBaseService

- (NSManagedObjectContext *)getContext {
  return [[NDatabaseService sharedInstance] getContext];
}

-(void)readNews:(News*)news {
  news.isRead = YES;
  [self save];
}

-(void)appendNews:(NSDictionary*)entity {
  if (![self containsNews:entity]) {
    News* news = [self insertNews];
    [news mapping:entity];
  }
}

-(News*)insertNews {
  return [NSEntityDescription insertNewObjectForEntityForName:NEWS_ENTITY_KEY inManagedObjectContext:[self getContext]];
}

-(BOOL)containsNews:(NSDictionary*)dict {
  NSFetchRequest *request = [[NSFetchRequest alloc] init];
  [request setPredicate:[NSPredicate predicateWithFormat:@"title == %@", [dict[XML_TITLE_KEY][XML_TEXT_KEY] normilize]]];
  NSEntityDescription *entity = [NSEntityDescription entityForName:NEWS_ENTITY_KEY inManagedObjectContext:[self getContext]];
  [request setEntity:entity];
  
  NSError *error = nil;
  NSUInteger count = [[self getContext] countForFetchRequest:request error:&error];
  
  if (!error) {
    return count > 0;
  }
  
  return false;
}

-(void)removeAll {
  NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:NEWS_ENTITY_KEY];
  NSBatchDeleteRequest* batch = [[NSBatchDeleteRequest alloc] initWithFetchRequest:request];
  [[self getContext] executeRequest:batch error:nil];
  [self save];
}

-(NSArray*)getAllNews {
  NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:NEWS_ENTITY_KEY];
  NSError *error = nil;
  NSArray *results = [[self getContext] executeFetchRequest:request error:&error];
  
  return results;
}

@end
