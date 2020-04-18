//
//  BaseViewController.h
//  News
//
//  Created by Admin on 16/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : UIViewController

-(void)configuration;
-(void)configurationView;
-(void)showErrorAlert:(NSError*)error;

@end

NS_ASSUME_NONNULL_END
