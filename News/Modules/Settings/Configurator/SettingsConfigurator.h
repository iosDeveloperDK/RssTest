//
//  SettingsConfigurator.h
//  News
//
//  Created by Admin on 17/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "NConfigProtocol.h"
#import "SettingsViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface SettingsConfigurator : NSObject <NConfigProtocol>

+ (void)configureWith:(id<SettingsViewInput>)controller;

@end

NS_ASSUME_NONNULL_END
