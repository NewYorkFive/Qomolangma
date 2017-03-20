//
//  QLMMineUserInfoBottomModel.h
//  Qomolangma
//
//  Created by Aioria on 2017/3/19.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QLMMineUserInfoBottomModel : NSObject


/**
 名字
 */
@property (nonatomic, copy)NSString *name;


/**
 详情
 */
@property (nonatomic, copy)NSString *detail;


/**
 用来记录的key
 */
@property (nonatomic, copy)NSString *key;


/**
 创建对象的方法

 @param dict 字典
 @return 返回对象
 */
+ (instancetype)mineUserInfoBottomModelWithDict: (NSDictionary *)dict;

@end
