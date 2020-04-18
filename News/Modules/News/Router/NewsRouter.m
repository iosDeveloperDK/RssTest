//
//  NNewsRouter.m
//  News
//
//  Created by Admin on 17/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import "NewsRouter.h"

@implementation NewsRouter

- (instancetype)initWithVC:(UIViewController*) vc {
  self = [super init];
  _vc = vc;
  
  return self;
}

- (void)pushVC:(UIViewController *)vc {
  UINavigationController* navigation = (UINavigationController *)self.vc;
  [navigation pushViewController:vc animated:YES];
}

@end
