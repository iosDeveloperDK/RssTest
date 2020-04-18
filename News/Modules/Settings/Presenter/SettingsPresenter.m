//
//  SettingsPresenter.m
//  News
//
//  Created by Admin on 17/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import "SettingsPresenter.h"

@interface SettingsPresenter ()


@end

@implementation SettingsPresenter

- (instancetype)initWithVC:(id<SettingsViewInput>)vc {
  self = [super init];
  _view = vc;
  return self;
}

-(void)viewLoad {
  [self.view updateTimerTime:[self.interactor currentTimerTime]];
}

- (void)updateTimerTime:(float)time {
  [self.interactor updateTimerTime:time];
}

- (SourceModel*)sourceForIndexPath:(nonnull NSIndexPath *)indexPath {
  return [self.interactor allSource][indexPath.row];
}

- (NSInteger)rowCount {
  return [[self.interactor allSource] count];
}

- (void)switchSource:(SourceModel*)source {
  [self.interactor switchSource:source];
}

@end
