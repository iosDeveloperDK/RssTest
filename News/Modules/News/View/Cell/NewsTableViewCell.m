//
//  NewsTableViewCell.m
//  News
//
//  Created by Admin on 16/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import "NewsTableViewCell.h"
#import <SDWebImage/SDWebImage.h>
#import "News+CoreDataClass.h"
#import "NSDate+Formatter.h"

@interface NewsTableViewCell ()

@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;
@property (weak, nonatomic) IBOutlet UIView *readView;
@property (weak, nonatomic) IBOutlet UILabel *sourceLabel;

@end

@implementation NewsTableViewCell

- (void)awakeFromNib {
  [super awakeFromNib];
  
  [self.containerView.layer setShadowOffset:CGSizeMake(0, 5)];
  [self.containerView.layer setShadowColor:[[UIColor blackColor] CGColor]];
  [self.containerView.layer setShadowOpacity:0.2];
}

- (void)configuration:(News*) object {
  self.titleLabel.text = object.title;
  self.dateLabel.text = [object.pubDate dateStringWithFormat:NORMILIZE_DATE_FORMATTER];
  self.sourceLabel.text = object.sourceTitle;
  [self.photoImageView sd_setImageWithURL:[NSURL URLWithString:object.image] placeholderImage:[UIImage imageNamed:@"unnamed"]];
  [self.readView setHidden:!object.isRead];
}

@end
