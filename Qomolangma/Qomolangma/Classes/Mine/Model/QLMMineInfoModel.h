//
//  QLMMineInfoModel.h
//  Qomolangma
//
//  Created by Aioria on 2017/3/16.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QLMMineInfoModel : NSObject

/**
 文字
 */
@property (nonatomic, copy)NSString *name;

/**
 图片名字
 */
@property (nonatomic, copy)NSString *icon;

/**
 数量详情
 */
@property (nonatomic, copy)NSString *detail;

@property (nonatomic, assign)BOOL isOrange;

/**
 字典转模型方法

 @param dict 字典
 @return 返回模型
 */
+ (QLMMineInfoModel *)mineInfoModelWithDict: (NSDictionary *)dict;

@end
