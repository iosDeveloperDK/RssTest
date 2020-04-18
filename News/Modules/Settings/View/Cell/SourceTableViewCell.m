//
//  SourceTableViewCell.m
//  News
//
//  Created by Admin on 17/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import "SourceTableViewCell.h"

@interface SourceTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *sourceLabel;
@property (weak, nonatomic) IBOutlet UISwitch *switchButton;
@property (strong, nonatomic) SwitchCompletionBlock switchBlock;
@end

@implementation SourceTableViewCell

- (void)configuration:(SourceModel*) source {
  [self.sourceLabel setText:source.title];
  [self.switchButton setOn:[source isEnabled]];
}

- (void)sourceSwitched:(SwitchCompletionBlock) block {
  self.switchBlock = block;
}

- (IBAction)switchChanged:(UISwitch *)sender {
  self.switchBlock(sender.isOn);
}

@end
