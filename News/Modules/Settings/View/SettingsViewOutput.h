//
//  SettingsViewOutput.h
//  News
//
//  Created by Admin on 17/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class SourceModel;
@protocol SettingsViewOutput <NSObject>

-(void)updateTimerTime:(float)time;
-(void)viewLoad;
-(void)switchSource:(SourceModel*)source;
-(SourceModel*)sourceForIndexPath:(nonnull NSIndexPath *)indexPath;
-(NSInteger)rowCount;

@end

NS_ASSUME_NONNULL_END
