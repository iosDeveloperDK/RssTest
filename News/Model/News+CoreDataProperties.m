//
//  News+CoreDataProperties.m
//  News
//
//  Created by Admin on 17/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//
//

#import "News+CoreDataProperties.h"

@implementation News (CoreDataProperties)

+ (NSFetchRequest<News *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:NEWS_ENTITY_KEY];
}

@dynamic author;
@dynamic image;
@dynamic isRead;
@dynamic link;
@dynamic pubDate;
@dynamic text;
@dynamic title;
@dynamic sourceTitle;
@dynamic sourceType;

@end
