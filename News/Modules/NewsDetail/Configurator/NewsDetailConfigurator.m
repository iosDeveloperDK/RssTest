//
//  NewsDetailConfigurator.m
//  News
//
//  Created by Admin on 18/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import "NewsDetailConfigurator.h"
#import "NewsDetailInteractor.h"
#import "NewsDetailPresenter.h"

@implementation NewsDetailConfigurator

+ (void)configureWith:(NewsDetailViewController*)controller {
  NewsDetailInteractor* interactor = [[NewsDetailInteractor alloc] init];
  NewsDetailPresenter* presenter = [[NewsDetailPresenter alloc] initWithVC:controller];

  controller.output = presenter;
  presenter.interactor = interactor;
}

@end
