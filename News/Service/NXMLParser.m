//
//  NXMLParser.m
//  News
//
//  Created by Admin on 16/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import "NXMLParser.h"
#import "NMappingProtocol.h"
#import "NConstants.h"

@interface NXMLParser ()<NSXMLParserDelegate>
{
    NSMutableArray *dictionaryStack;
    NSMutableString *textInProgress;
}
@property (strong, nonatomic) NSData *xmlData;
@end

@implementation NXMLParser

+ (NSDictionary *)dictionaryForXMLData:(NSData *)data {
  
    NXMLParser *reader = [[NXMLParser alloc] init];
    NSDictionary *rootDictionary = [reader objectWithData:data];
  
    return rootDictionary;
}

+ (NSArray*)modelsForXMLData:(NSData *)data {
  
  NXMLParser *reader = [[NXMLParser alloc] init];
  NSDictionary *rootDictionary = [reader objectWithData:data];
  NSDictionary* rss = [rootDictionary valueForKey:XML_RSS_KEY];
  
  if (rss) {
    NSDictionary* channel = [rss objectForKey:XML_CHANNEL_KEY];
    if (channel) {
      return [channel objectForKey:XML_ITEM_KEY];
    }
  }
  
  return @[];
}

- (NSDictionary *)objectWithData:(NSData *)data {

    dictionaryStack = [[NSMutableArray alloc] init];
    textInProgress = [[NSMutableString alloc] init];
    [dictionaryStack addObject:[NSMutableDictionary dictionary]];

    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
    parser.delegate = self;
    BOOL success = [parser parse];

    if (success) {
        return [dictionaryStack objectAtIndex:0];
    }

    return nil;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {
  
    NSMutableDictionary *parentDict = [dictionaryStack lastObject];

    NSMutableDictionary *childDict = [NSMutableDictionary dictionary];
    [childDict addEntriesFromDictionary:attributeDict];

    id existingValue = [parentDict objectForKey:elementName];
    if (existingValue) {
        NSMutableArray *array = nil;
        if ([existingValue isKindOfClass:[NSMutableArray class]]) {
            array = (NSMutableArray *) existingValue;
        } else {
            array = [NSMutableArray array];
            [array addObject:existingValue];
            [parentDict setObject:array forKey:elementName];
        }

        [array addObject:childDict];
    } else {
        [parentDict setObject:childDict forKey:elementName];
    }

    [dictionaryStack addObject:childDict];
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
  
    NSMutableDictionary *dictInProgress = [dictionaryStack lastObject];
    if ([textInProgress length] > 0) {
        [dictInProgress setObject:textInProgress forKey:XML_TEXT_NODE_KEY];
        textInProgress = [[NSMutableString alloc] init];
    }

    [dictionaryStack removeLastObject];
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    [textInProgress appendString:string];
}

@end
