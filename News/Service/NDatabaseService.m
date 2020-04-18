//
//  NDatabaseService.m
//  News
//
//  Created by Admin on 17/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import "NDatabaseService.h"
#import <CoreData/CoreData.h>

static NSString *const DB_NAME_KEY = @"News";

@interface NDatabaseService ()
@property(nonatomic, strong) NSPersistentContainer* container;
@end

@implementation NDatabaseService

+ (instancetype)sharedInstance
{
    static NDatabaseService *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
      sharedInstance = [[NDatabaseService alloc] init];
    });
    return sharedInstance;
}

-(NSManagedObjectContext*)getContext {
  return self.container.viewContext;
}

-(void)createDB {
  self.container = [NSPersistentContainer persistentContainerWithName:DB_NAME_KEY];
  self.container.persistentStoreDescriptions.firstObject.type = NSSQLiteStoreType;  
  [self.container loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription * _Nonnull descriptor, NSError * _Nullable error) {
    if (error) {
      assert(error);
    }
  }];
}

-(void)save {
  if ([[self getContext] hasChanges]) {
    NSError *error = nil;
    [[self getContext] save:&error];    
    if (error) {
      NSLog(@"%@",[error localizedDescription]);
    }
  }
}

@end
