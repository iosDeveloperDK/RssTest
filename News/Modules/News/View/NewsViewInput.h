//
//  NewsViewInput.h
//  News
//
//  Created by Admin on 16/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NViewInputProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@protocol NewsViewInput <NSObject,NViewInputProtocol>

-(void)reloadTable;
-(void)showError:(NSError*)error;

@end

NS_ASSUME_NONNULL_END
