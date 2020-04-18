//
//  NewsDetailViewController.m
//  News
//
//  Created by Admin on 18/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import "NewsDetailViewController.h"
#import "NSDate+Formatter.h"
#import "NSString+Formatter.h"
#import <SDWebImage/SDWebImage.h>

@interface NewsDetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *newsImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@end

@implementation NewsDetailViewController

- (void)configuration {  
  News* news = [self.output getNews];
  self.titleLabel.text = news.title;
  self.timeLabel.text = [news.pubDate dateStringWithFormat:NORMILIZE_DATE_FORMATTER];
  self.textLabel.text = news.text;
  self.authorLabel.text = news.sourceTitle;
  [self.newsImageView sd_setImageWithURL:[NSURL URLWithString:news.image] placeholderImage:[UIImage imageNamed:@"unnamed"]];
}

- (void)configurationView {
  self.title = DETAIL_NAV_TITLE;
}

- (IBAction)moreTapped:(UIButton *)sender {
  [self.output openFullDetail];
}

@end
