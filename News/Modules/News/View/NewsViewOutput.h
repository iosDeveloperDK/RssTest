//
//  NewsViewOutput.h
//  News
//
//  Created by Admin on 16/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NMappingProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@protocol NewsViewOutput <NSObject>

-(void)fetchData;
-(id<NMappingProtocol>)modelForIndexPath:(NSIndexPath*)indexPath;
-(NSInteger)rowCount;
-(void)readNewsForIndexPath:(NSIndexPath*)indexPath;
-(void)openSettings;
-(void)viewWillAppeare;

@end

NS_ASSUME_NONNULL_END
