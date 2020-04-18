//
//  NTimerService.m
//  News
//
//  Created by Admin on 17/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import "NTimerService.h"
#import "NTimerService+Defaults.h"
#import "NConstants.h"

@interface NTimerService ()
@property(nonatomic,strong) NSTimer *timer;
@end

@implementation NTimerService

+ (instancetype)sharedInstance
{
    static NTimerService *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
      sharedInstance = [[NTimerService alloc] init];
    });
    return sharedInstance;
}

-(void)start {
  [self setUpdateTimer:[NTimerService getUpdateTime]];
}

-(void)setUpdateTimer:(float)time {
  self.timer = [NSTimer scheduledTimerWithTimeInterval:time*MINUTE_SECONDS  target:self selector:@selector(updateTimer:) userInfo:nil repeats:YES];
}

- (void)updateTimer:(NSTimer *)theTimer {
  [[NSNotificationCenter defaultCenter] postNotification:[NSNotification notificationWithName:NOTIFICATION_FETCH_KEY object:nil]];
}

- (void)dealloc {
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
