//
//  NTimerService.h
//  News
//
//  Created by Admin on 17/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NTimerService : NSObject

-(void)start;
-(void)setUpdateTimer:(float)time;

+ (instancetype)sharedInstance;

@end

NS_ASSUME_NONNULL_END
