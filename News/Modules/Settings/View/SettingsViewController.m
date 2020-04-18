//
//  SettingsViewController.m
//  News
//
//  Created by Admin on 17/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import "SettingsViewController.h"
#import "SettingsViewOutput.h"
#import "SettingsConfigurator.h"
#import "SourceTableViewCell.h"

@interface SettingsViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *timeTextField;
@property (weak, nonatomic) IBOutlet UIStepper *stepperView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation SettingsViewController

- (void)configuration {
  [SettingsConfigurator configureWith:self];
  [self.output viewLoad];
}

- (void)configurationView {
  self.title = SETTINGS_NAV_TITLE;
  
  NSString* indetifier = NSStringFromClass([SourceTableViewCell class]);
  [self.tableView registerNib:[UINib nibWithNibName:indetifier bundle:nil] forCellReuseIdentifier:indetifier];
  [self.tableView setRowHeight:UITableViewAutomaticDimension];
}

- (IBAction)stepperChange:(UIStepper *)sender {
  self.timeTextField.text = [NSString stringWithFormat:@"%0.f", [sender value]];
  [self.output updateTimerTime:[sender value]];
}

- (void)updateTimerTime:(float)time {
  self.timeTextField.text = [NSString stringWithFormat:@"%0.f", time];
  [self.stepperView setValue:time];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  NSString* indetifier = NSStringFromClass([SourceTableViewCell class]);
  SourceTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:indetifier];
  
  if (cell) {
    [cell configuration:[self.output sourceForIndexPath:indexPath]];
    [cell sourceSwitched:^(BOOL isOn) {
      [self.output switchSource:[self.output sourceForIndexPath:indexPath]];
    }];
    return cell;
  }
  
  return [UITableViewCell new];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [self.output rowCount];
}

@end
