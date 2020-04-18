//
//  NSDate+NNSDate.h
//  News
//
//  Created by Admin on 17/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//


#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (Formatter)

-(NSString*)dateStringWithFormat:(NSString*)format;

@end

NS_ASSUME_NONNULL_END
