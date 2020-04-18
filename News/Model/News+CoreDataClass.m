//
//  News+CoreDataClass.m
//  News
//
//  Created by Admin on 17/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//
//

#import "News+CoreDataClass.h"
#import "NSString+Formatter.h"
#import "SourceModel.h"

@implementation News

- (instancetype)mapping:(NSDictionary*) dict {
  
  self.title = [dict[XML_TITLE_KEY][XML_TEXT_KEY] normilize];
  self.author = [dict[XML_AUTHOR_KEY][XML_TEXT_KEY] normilize];
  self.link = [dict[XML_LINK_KEY][XML_TEXT_KEY] normilize];
  self.pubDate = [dict[XML_PUBDATE_KEY][XML_TEXT_KEY] date];
  
  SourceModel* model = dict[XML_SOURCE_KEY];
  self.sourceType = model._id;
  self.sourceTitle = model.title;

  id description = dict[XML_DESCRIPTION_KEY];
  id enclosure = dict[XML_ENCLOSURE_KEY];

  if ([description isKindOfClass:[NSDictionary class]]) {
      self.text = [description[XML_TEXT_KEY] normilize];
  }
  if ([enclosure isKindOfClass:[NSDictionary class]]) {
      self.image = enclosure[XML_URL_KEY];
  }
  
  return self;
}

@end
