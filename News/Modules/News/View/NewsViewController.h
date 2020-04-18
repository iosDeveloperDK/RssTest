//
//  NewsViewController.h
//  News
//
//  Created by Admin on 16/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "NewsViewInput.h"
#import "NDatabaseService.h"

NS_ASSUME_NONNULL_BEGIN

@protocol NewsViewOutput;

@interface NewsViewController : BaseViewController <NewsViewInput,NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) id<NewsViewOutput> output;

@end

NS_ASSUME_NONNULL_END
