//
//  SettingsViewInput.h
//  News
//
//  Created by Admin on 17/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NViewInputProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@protocol SettingsViewInput <NSObject,NViewInputProtocol>

- (void)updateTimerTime:(float)time;

@end

NS_ASSUME_NONNULL_END
