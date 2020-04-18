//
//  NXMLParser.h
//  News
//
//  Created by Admin on 16/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NXMLParser : NSObject

+ (NSDictionary *)dictionaryForXMLData:(NSData *)data;
+ (NSArray*)modelsForXMLData:(NSData *)data;

@end

NS_ASSUME_NONNULL_END
