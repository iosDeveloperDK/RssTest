//
//  SettingsConfigurator.m
//  News
//
//  Created by Admin on 17/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import "SettingsConfigurator.h"
#import "BaseViewController.h"
#import "SettingsInteractor.h"
#import "SettingsPresenter.h"

@implementation SettingsConfigurator

+ (void)configureWith:(SettingsViewController*)controller {
  SettingsInteractor* interactor = [[SettingsInteractor alloc] init];
  SettingsPresenter* presenter = [[SettingsPresenter alloc] initWithVC:controller];

  controller.output = presenter;
  presenter.interactor = interactor;
}


@end
