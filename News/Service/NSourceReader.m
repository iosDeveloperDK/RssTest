//
//  NSourceReader.m
//  News
//
//  Created by Admin on 17/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import "NSourceReader.h"
#import "NConstants.h"

@implementation NSourceReader

+(NSArray<SourceModel*>*)getSources {
  NSMutableArray* sourcesArray = [NSMutableArray new];
  NSDictionary* json = [NSourceReader JSONFromFile];
  NSArray* sources = json[SOURCE_KEY];
  
  for (NSDictionary* source in sources) {
    [sourcesArray addObject:[[SourceModel alloc]initWithDictinary:source]];
  }
  
  return sourcesArray;
}

+(NSDictionary *)JSONFromFile {
    NSString *path = [[NSBundle mainBundle] pathForResource:SOURCE_KEY ofType:TYPE];
    NSData *data = [NSData dataWithContentsOfFile:path];
    return [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
}

@end
