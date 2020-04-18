//
//  NewsPresenter.h
//  News
//
//  Created by Admin on 16/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsViewOutput.h"
#import "NewsViewController.h"
#import "NewsInteractorInput.h"
#import "NDatabaseService.h"
#import "NRouterProtocol.h"

NS_ASSUME_NONNULL_BEGIN
@protocol NewsViewInput;
@protocol NewsInteractorInput;

@interface NewsPresenter : NSObject <NewsViewOutput>

@property (nonatomic, weak) id<NewsViewInput,NSFetchedResultsControllerDelegate> view;
@property (nonatomic, strong) id<NewsInteractorInput> interactor;
@property (nonatomic, strong) id<NRouterProtocol> router;

- (instancetype)initWithVC:(NewsViewController*) vc;

@end

NS_ASSUME_NONNULL_END
