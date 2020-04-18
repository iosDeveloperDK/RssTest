//
//  RequestService.m
//  News
//
//  Created by Admin on 16/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import "NRequestService.h"

@interface NRequestService ()

@property (nonatomic, strong) NSURLSession *session;

@end

@implementation NRequestService


- (instancetype)initService {
  self = [super init];
  if (!_session) {
    _session = [NSURLSession sharedSession];
  }
  return self;
}

- (void)requestWithURL:(NSURL*)url completionBlock:(ResponsBlock)block {
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    NSURLSessionDataTask *dataTask = [self.session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
      block(data, error);
    }];
    
    [dataTask resume];
}

@end
