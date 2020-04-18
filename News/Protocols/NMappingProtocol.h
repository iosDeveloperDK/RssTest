//
//  MappingProtocol.h
//  News
//
//  Created by Admin on 16/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NConstants.h"

NS_ASSUME_NONNULL_BEGIN

@protocol NMappingProtocol <NSObject>

- (instancetype)mapping:(NSDictionary*) dict;

@end

NS_ASSUME_NONNULL_END
