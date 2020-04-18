//
//  NewsInteractorInput.h
//  News
//
//  Created by Admin on 16/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "News+CoreDataClass.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^ __nullable NewsCompletionBlock)(NSArray *models, NSError* error);

@protocol NewsInteractorInput <NSObject>

-(void)fetchData:(NewsCompletionBlock)block;
-(void)readNews:(News*)news;

@end

NS_ASSUME_NONNULL_END
