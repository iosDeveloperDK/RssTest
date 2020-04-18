//
//  SettingsViewController.h
//  News
//
//  Created by Admin on 17/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import "BaseViewController.h"
#import "SettingsViewInput.h"
#import "NDatabaseService.h"

NS_ASSUME_NONNULL_BEGIN
@protocol SettingsViewOutput;

@interface SettingsViewController : BaseViewController <SettingsViewInput, NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) id<SettingsViewOutput> output;


@end

NS_ASSUME_NONNULL_END
