//
//  NewsDetailInteractor.m
//  News
//
//  Created by Admin on 18/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import "NewsDetailInteractor.h"
#import <UIKit/UIKit.h>

@implementation NewsDetailInteractor

- (void)openFullDetailWithNews:(News*)news {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString: [NSString stringWithFormat:@"%@",news.link]]
                                       options:@{}
                             completionHandler:nil];
}

@end
