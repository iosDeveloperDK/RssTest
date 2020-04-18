//
//  NewsDetailInteractorInput.h
//  News
//
//  Created by Admin on 18/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "News+CoreDataProperties.h"

NS_ASSUME_NONNULL_BEGIN

@protocol NewsDetailInteractorInput <NSObject>

- (void)openFullDetailWithNews:(News*)news;

@end

NS_ASSUME_NONNULL_END
