//
//  NRouterProtocol.h
//  News
//
//  Created by Admin on 17/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol NRouterProtocol <NSObject>

-(void)pushVC:(UIViewController*)vc;

@end

NS_ASSUME_NONNULL_END
