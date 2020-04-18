//
//  NConfigProtocol.h
//  News
//
//  Created by Admin on 16/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NViewInputProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@protocol NConfigProtocol <NSObject>

+(void)configureWith:(id<NViewInputProtocol>) controller;

@end

NS_ASSUME_NONNULL_END
