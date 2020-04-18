//
//  NewsDetailConfigurator.h
//  News
//
//  Created by Admin on 18/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "NConfigProtocol.h"
#import "NewsDetailViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface NewsDetailConfigurator : NSObject <NConfigProtocol>

+ (void)configureWith:(id<NViewInputProtocol>)controller;

@end

NS_ASSUME_NONNULL_END
