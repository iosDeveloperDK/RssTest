//
//  SettingsInteractor.m
//  News
//
//  Created by Admin on 17/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import "SettingsInteractor.h"
#import "NTimerService.h"
#import "NTimerService+Defaults.h"
#import "NSourceReader.h"

@implementation SettingsInteractor

- (void)updateTimerTime:(float)time {
  [NTimerService setUpdateTime:time];
  [[NTimerService sharedInstance] setUpdateTimer:time];
}

-(float)currentTimerTime {
  return [NTimerService getUpdateTime];
}

-(NSArray<SourceModel*>*)allSource {
  return [NSourceReader getSources];
}

- (void)switchSource:(SourceModel*)source {
  [source switchEnabled];
}

@end
