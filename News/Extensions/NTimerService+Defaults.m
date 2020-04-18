//
//  NTimerService+Defaults.m
//  News
//
//  Created by Admin on 17/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import "NTimerService+Defaults.h"
#import "NConstants.h"

@implementation NTimerService (Defaults)

+(void)setUpdateTime:(float)time {
  [[NSUserDefaults standardUserDefaults] setFloat:time forKey:TIME_KEY];
  [[NSUserDefaults standardUserDefaults] synchronize];
}

+(float)getUpdateTime {
  float time = [[NSUserDefaults standardUserDefaults] floatForKey:TIME_KEY];
  if (time) {
    return time;
  } else {
    return DEFAULT_TIME;
  }
}

@end
