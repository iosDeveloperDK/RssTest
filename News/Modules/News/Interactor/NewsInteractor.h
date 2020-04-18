//
//  NewsInteractor.h
//  News
//
//  Created by Admin on 16/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsInteractorInput.h"
#import "NewsViewController.h"
#import "NewsInteractorInput.h"

NS_ASSUME_NONNULL_BEGIN
@protocol NewsInteractorOutput;

@interface NewsInteractor : NSObject <NewsInteractorInput>

@property (nonatomic, weak) id<NewsInteractorOutput> output;

@end

NS_ASSUME_NONNULL_END
