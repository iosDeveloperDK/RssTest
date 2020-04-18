//
//  SettingsInteractorInput.h
//  News
//
//  Created by Admin on 17/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class SourceModel;
@protocol SettingsInteractorInput <NSObject>

-(void)updateTimerTime:(float)time;
-(float)currentTimerTime;

-(void)switchSource:(SourceModel*)source;
-(NSArray<SourceModel*>*)allSource;

@end

NS_ASSUME_NONNULL_END
