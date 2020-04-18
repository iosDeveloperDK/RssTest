//
//  SourceTableViewCell.h
//  News
//
//  Created by Admin on 17/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SourceModel.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^SwitchCompletionBlock)(BOOL isOn);

@interface SourceTableViewCell : UITableViewCell

- (void)configuration:(SourceModel*) source;
- (void)sourceSwitched:(SwitchCompletionBlock) block;

@end

NS_ASSUME_NONNULL_END
