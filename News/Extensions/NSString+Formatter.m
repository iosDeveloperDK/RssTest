//
//  NSString+NNSString.m
//  News
//
//  Created by Admin on 16/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import "NSString+Formatter.h"
#import "NConstants.h"

@implementation NSString (Formatter)

-(NSString*)normilize {
  return [self stringByTrimmingCharactersInSet:
          [NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

-(NSDate*)date {
  NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
  [formatter setDateFormat:PARSE_DATE_FORMATTER];
  NSDate* date = [formatter dateFromString:self];
  return date;
}

@end

