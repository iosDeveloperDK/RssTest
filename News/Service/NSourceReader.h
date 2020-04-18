//
//  NSourceReader.h
//  News
//
//  Created by Admin on 17/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SourceModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface NSourceReader : NSObject

+(NSArray<SourceModel*>*)getSources;

@end

NS_ASSUME_NONNULL_END
