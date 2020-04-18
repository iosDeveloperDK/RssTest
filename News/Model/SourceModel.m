//
//  SourceModel.m
//  News
//
//  Created by Admin on 17/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import "SourceModel.h"
#import "NConstants.h"

@implementation SourceModel

-(instancetype)initWithDictinary:(NSDictionary*)dict {
  self = [super init];
  
  __id = [dict[ID_KEY] integerValue];
  _title = dict[TITLE_KEY];
  _urlString = dict[URL_KEY];
  _url = [NSURL URLWithString:_urlString];

  return self;
}

-(BOOL)isEnabled {
  return ![[NSUserDefaults standardUserDefaults] boolForKey:_title];
}

-(void)switchEnabled {
  [[NSUserDefaults standardUserDefaults] setBool:[self isEnabled] forKey:_title];
  [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
