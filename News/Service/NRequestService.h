//
//  RequestService.h
//  News
//
//  Created by Admin on 16/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

typedef void(^ResponseCompletionBlock)(NSArray *data);
typedef void(^ResponsBlock)(NSData *data, NSError* error);

@interface NRequestService : NSObject

- (void)requestWithURL:(NSURL*)url completionBlock:(ResponsBlock)block;

- (instancetype)initService;

@end

NS_ASSUME_NONNULL_END
