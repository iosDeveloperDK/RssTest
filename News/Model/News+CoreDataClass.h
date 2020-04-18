//
//  News+CoreDataClass.h
//  News
//
//  Created by Admin on 17/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "NMappingProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface News : NSManagedObject <NMappingProtocol>

@end

NS_ASSUME_NONNULL_END

#import "News+CoreDataProperties.h"
