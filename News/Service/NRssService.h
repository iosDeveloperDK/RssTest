//
//  NRssService.h
//  News
//
//  Created by Admin on 17/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SourceModel.h"
NS_ASSUME_NONNULL_BEGIN

typedef void(^RssBlock)(NSArray *models, NSError* error);

@interface NRssService : NSObject

-(void)rssRead:(NSArray<SourceModel*>*)sources completionBlock:(RssBlock)block;

@end

NS_ASSUME_NONNULL_END
