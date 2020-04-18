//
//  NNewsRouter.h
//  News
//
//  Created by Admin on 17/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NRouterProtocol.h"
#import "NRouterProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface NewsRouter : NSObject <NRouterProtocol>

@property(nonatomic, weak) UIViewController*vc;
- (instancetype)initWithVC:(UIViewController*) vc;

@end

NS_ASSUME_NONNULL_END
