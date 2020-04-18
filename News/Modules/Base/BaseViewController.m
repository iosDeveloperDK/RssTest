//
//  BaseViewController.m
//  News
//
//  Created by Admin on 16/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
  [self configuration];
  [self configurationView];
}

-(void)configuration {}
-(void)configurationView {}


-(void)showErrorAlert:(NSError*)error {
  UIAlertController* controller = [UIAlertController alertControllerWithTitle:@"Error" message:[error localizedDescription] preferredStyle:UIAlertControllerStyleAlert];
  [controller addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
  [self presentViewController:controller animated:YES completion:nil];
}

@end
