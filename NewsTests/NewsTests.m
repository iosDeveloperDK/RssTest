//
//  NewsTests.m
//  NewsTests
//
//  Created by Admin on 16/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NDatabaseService.h"
#import "NSourceReader.h"
#import "NRequestService.h"
#import "NRssService.h"
#import "NewsInteractor.h"
#import "NNewsDataBaseService.h"

@interface NewsTests : XCTestCase

@property(nonatomic, strong)NDatabaseService* db;
@property(nonatomic, strong)NRequestService* request;
@property(nonatomic, strong)NRssService* rss;
@property(nonatomic, strong)NNewsDataBaseService* newsDB;


@end

@implementation NewsTests

- (void)setUp {
  self.db = [NDatabaseService sharedInstance];
  self.request = [[NRequestService alloc] initService];
  self.rss = [NRssService new];
  self.newsDB = [[NNewsDataBaseService alloc] init];
}

- (void)testCreateDBContenxt {
  XCTAssertNotNil([self.db getContext]);
}

- (void)testEqualInstanceDB {
  XCTAssertEqual(self.db, [NDatabaseService sharedInstance]);
}

- (void)testEqualInstanceDBContext {
  XCTAssertEqual([self.db getContext], [[NDatabaseService sharedInstance] getContext]);
}

- (void)testSourceReaderReturnValue {
  XCTAssertNotNil([NSourceReader getSources]);
}

- (void)testSourceReaderReturnValueGreaterThanZero {
  XCTAssertGreaterThan([[NSourceReader getSources] count], 0);
}

- (void)testRequestGetCode200 {
  NSURL* url = [NSURL URLWithString:@"https://lenta.ru/rss"];
  XCTestExpectation* promise = [[XCTestExpectation alloc]initWithDescription:@"Status code: 200"];
  
  [self.request requestWithURL:url completionBlock:^(NSData * _Nonnull data, NSError * _Nonnull error) {
  
    XCTAssertNotNil(data, @"No data was downloaded.");

    if (error) {
      XCTFail(@"REQUEST FAIL");
    }
    
    [promise fulfill];
  }];
  
  [self waitForExpectations:@[promise] timeout:10];
}

- (void)testRSS {
  XCTestExpectation* promise = [[XCTestExpectation alloc]initWithDescription:@"RSS"];
  NSArray* sources = [NSourceReader getSources];
  
  [self.rss rssRead:sources completionBlock:^(NSArray * _Nonnull models, NSError * _Nonnull error) {
    
    XCTAssertNotNil(models, @"No data was downloaded.");

    if (models) {
      XCTAssertGreaterThan([models count], 0);
    } else {
      XCTFail(@"REQUEST FAIL");
    }
    
    [promise fulfill];
  }];

  [self waitForExpectations:@[promise] timeout:10];
}

- (void)testNewsInteractorModule {
  XCTestExpectation* promise = [[XCTestExpectation alloc]initWithDescription:@"NewsInteractor"];
  if ([self.newsDB getAllNews] > 0) {
    [self.newsDB removeAll];
  }
  
  XCTAssertEqual([[self.newsDB getAllNews] count], 0);

  NewsInteractor* interactor = [NewsInteractor new];
  [interactor fetchData:^(NSArray * _Nonnull models, NSError * _Nonnull error) {
    XCTAssertGreaterThan([[self.newsDB getAllNews] count], 0);
    [promise fulfill];
  }];
  
  [self waitForExpectations:@[promise] timeout:10];
}

@end
