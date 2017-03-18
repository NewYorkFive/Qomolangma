//
//  QLMSpecialColumn.h
//  Qomolangma
//
//  Created by 张晨晖 on 2017/3/16.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QLMSpecialColumn : NSObject

///订阅多久多少钱的多久
@property (nonatomic, strong) NSString *price_unit;

///多久之前更新的
@property (nonatomic, strong) NSString *update_time;

///讲述人简介
@property (nonatomic, strong) NSString *person_info;

///讲述人名字
@property (nonatomic, strong) NSString *author;

///讲述人图片
@property (nonatomic, strong) NSString *image_url;

///订阅价格
@property (nonatomic, strong) NSString *price;

///标题名字
@property (nonatomic, strong) NSString *name;

///中间的文字介绍
@property (nonatomic, strong) NSString *last_title;

///底部的文字
@property (nonatomic, strong) NSString *content;

@end
