//
//  NewsTableViewCell.h
//  News
//
//  Created by Admin on 16/04/2020.
//  Copyright © 2020 Denis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NMappingProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface NewsTableViewCell : UITableViewCell

- (void)configuration:(id<NMappingProtocol>) object;

@end

NS_ASSUME_NONNULL_END
