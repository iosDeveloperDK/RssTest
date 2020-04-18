//
//  NewsDetailPresenter.h
//  News
//
//  Created by Admin on 18/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsDetailViewOutput.h"
#import "NewsDetailInteractorInput.h"

NS_ASSUME_NONNULL_BEGIN
@protocol NewsDetailViewInput;
@class UIViewController;

@interface NewsDetailPresenter : NSObject<NewsDetailViewOutput>

@property (nonatomic, weak) id<NewsDetailViewInput> view;
@property (nonatomic, strong) id<NewsDetailInteractorInput> interactor;

- (instancetype)initWithVC:(UIViewController*) vc;

@end

NS_ASSUME_NONNULL_END
