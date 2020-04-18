//
//  NNewsDataBaseService.h
//  News
//
//  Created by Admin on 17/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NDatabaseService.h"

NS_ASSUME_NONNULL_BEGIN

@interface NNewsDataBaseService : NDatabaseService

-(News*)insertNews;
-(void)readNews:(News*)news;
-(void)appendNews:(NSDictionary*)entity;
-(void)removeAll;
-(NSArray*)getAllNews;

@end

NS_ASSUME_NONNULL_END
