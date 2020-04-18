//
//  NConstants.h
//  News
//
//  Created by Admin on 18/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NConstants : NSObject

extern NSString * const XML_CHANNEL_KEY;
extern NSString * const XML_ITEM_KEY;
extern NSString * const XML_RSS_KEY;
extern NSString * const XML_TEXT_NODE_KEY;
extern NSString * const XML_TITLE_KEY;
extern NSString * const XML_DESCRIPTION_KEY;
extern NSString * const XML_ENCLOSURE_KEY;
extern NSString * const XML_URL_KEY;
extern NSString * const XML_PUBDATE_KEY;
extern NSString * const XML_SOURCE_KEY;
extern NSString * const XML_TEXT_KEY;
extern NSString * const XML_AUTHOR_KEY;
extern NSString * const XML_LINK_KEY;

extern NSString * const ID_KEY;
extern NSString * const TITLE_KEY;
extern NSString * const URL_KEY;

extern NSString * const PARSE_DATE_FORMATTER;
extern NSString * const NORMILIZE_DATE_FORMATTER;

extern NSString * const NEWS_NAV_TITLE;
extern NSString * const SETTINGS_NAV_TITLE;
extern NSString * const DETAIL_NAV_TITLE;

extern NSString *const NOTIFICATION_FETCH_KEY;

extern NSString *const TIME_KEY;
extern NSString *const SOURCE_OBJECT_KEY;
extern NSString *const SOURCE_KEY;
extern NSString *const TYPE;

extern NSString *const NEWS_ENTITY_KEY;

extern float const MINUTE_SECONDS;
extern float const DEFAULT_TIME;

@end

NS_ASSUME_NONNULL_END
