//
//  NewsDetailViewController.h
//  News
//
//  Created by Admin on 18/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import "BaseViewController.h"
#import "News+CoreDataProperties.h"
#import "NewsDetailViewInput.h"
#import "NewsDetailViewOutput.h"
NS_ASSUME_NONNULL_BEGIN

@interface NewsDetailViewController : BaseViewController <NewsDetailViewInput>

@property (nonatomic, strong) id<NewsDetailViewOutput> output;

@end

NS_ASSUME_NONNULL_END
