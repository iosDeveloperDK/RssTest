//
//  SettingsPresenter.h
//  News
//
//  Created by Admin on 17/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsViewOutput.h"
#import "SettingsViewController.h"
#import "NewsInteractorInput.h"
#import "NDatabaseService.h"
#import "NRouterProtocol.h"
#import "SettingsViewOutput.h"
#import "SettingsInteractorInput.h"

NS_ASSUME_NONNULL_BEGIN
@protocol SettingsViewInput;

@interface SettingsPresenter : NSObject <SettingsViewOutput>

@property (nonatomic, weak) id<SettingsViewInput> view;
@property (nonatomic, strong) id<SettingsInteractorInput> interactor;
@property (nonatomic, strong) id<NRouterProtocol> router;

- (instancetype)initWithVC:(SettingsViewController*) vc;

@end

NS_ASSUME_NONNULL_END
