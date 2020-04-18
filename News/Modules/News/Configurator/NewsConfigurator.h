//
//  NewsConfigurator.h
//  News
//
//  Created by Admin on 16/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "NConfigProtocol.h"
#import "NewsPresenter.h"

NS_ASSUME_NONNULL_BEGIN

@interface NewsConfigurator : NSObject <NConfigProtocol>

+ (void)configureWith:(id<NewsViewInput>)controller;

@end

NS_ASSUME_NONNULL_END
