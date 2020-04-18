//
//  NSDate+NNSDate.m
//  News
//
//  Created by Admin on 17/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import "NSDate+Formatter.h"

@implementation NSDate (Formatter)

-(NSString*)dateStringWithFormat:(NSString*)format {
  NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
  [formatter setDateFormat:format];

  return [formatter stringFromDate:self];
}

@end
