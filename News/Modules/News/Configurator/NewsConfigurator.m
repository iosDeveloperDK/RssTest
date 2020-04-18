//
//  NewsConfigurator.m
//  News
//
//  Created by Admin on 16/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import "NewsConfigurator.h"
#import "BaseViewController.h"
#import "NewsInteractor.h"
#import "NewsRouter.h"

@implementation NewsConfigurator

+ (void)configureWith:(NewsViewController*)controller {
  NewsInteractor* interactor = [[NewsInteractor alloc] init];
  NewsPresenter* presenter = [[NewsPresenter alloc] initWithVC:controller];
  NewsRouter* router = [[NewsRouter alloc] initWithVC:controller.navigationController];

  controller.output = presenter;
  presenter.interactor = interactor;
  presenter.router = router;
}

@end
