//
//  NewsDetailPresenter.m
//  News
//
//  Created by Admin on 18/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import "NewsDetailPresenter.h"

@interface NewsDetailPresenter ()

@property(nonatomic,strong)News* news;

@end

@implementation NewsDetailPresenter

- (instancetype)initWithVC:(id<NewsDetailViewInput>)vc {
  self = [super init];
  _view = vc;
  return self;
}

- (void)appendNews:(News *)news {
  self.news = news;
}

- (nonnull News *)getNews {
  return self.news;
}

- (void)openFullDetail {
  [self.interactor openFullDetailWithNews:self.news];
}

@end
