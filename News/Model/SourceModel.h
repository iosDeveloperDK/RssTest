//
//  SourceModel.h
//  News
//
//  Created by Admin on 17/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SourceModel : NSObject

@property (nonatomic, assign) NSInteger _id;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *urlString;
@property (nonatomic, strong) NSURL *url;

-(instancetype)initWithDictinary:(NSDictionary*)dict;
-(BOOL)isEnabled;
-(void)switchEnabled;

@end

NS_ASSUME_NONNULL_END
