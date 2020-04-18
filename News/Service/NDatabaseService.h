//
//  NDatabaseService.h
//  News
//
//  Created by Admin on 17/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "News+CoreDataClass.h"

NS_ASSUME_NONNULL_BEGIN

@interface NDatabaseService : NSObject

-(NSManagedObjectContext*)getContext;
-(void)createDB;
-(void)save;

+(instancetype)sharedInstance;

@end

NS_ASSUME_NONNULL_END
