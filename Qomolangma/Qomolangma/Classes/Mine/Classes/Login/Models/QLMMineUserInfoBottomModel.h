//
//  QLMMineUserInfoBottomModel.h
//  Qomolangma
//
//  Created by Aioria on 2017/3/19.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QLMMineUserInfoBottomModel : NSObject

@property (nonatomic, copy)NSString *name;

@property (nonatomic, copy)NSString *detail;

@property (nonatomic, copy)NSString *key;

+ (instancetype)mineUserInfoBottomModelWithDict: (NSDictionary *)dict;

@end
