//
//  NTimerService+Defaults.h
//  News
//
//  Created by Admin on 17/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//
#import "NTimerService.h"

NS_ASSUME_NONNULL_BEGIN

@interface NTimerService (Defaults)

+(void)setUpdateTime:(float)time;
+(float)getUpdateTime;

@end

NS_ASSUME_NONNULL_END
