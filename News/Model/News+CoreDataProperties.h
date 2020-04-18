//
//  News+CoreDataProperties.h
//  News
//
//  Created by Admin on 17/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//
//

#import "News+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface News (CoreDataProperties)

+ (NSFetchRequest<News *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *author;
@property (nullable, nonatomic, copy) NSString *image;
@property (nullable, nonatomic, copy) NSString *link;
@property (nullable, nonatomic, copy) NSDate *pubDate;
@property (nullable, nonatomic, copy) NSString *text;
@property (nullable, nonatomic, copy) NSString *title;
@property (nullable, nonatomic, copy) NSString *sourceTitle;
@property (nonatomic) int16_t sourceType;
@property (nonatomic) BOOL isRead;

@end

NS_ASSUME_NONNULL_END
