//
//  QLMSpecialColumn.h
//  Qomolangma
//
//  Created by 张晨晖 on 2017/3/16.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QLMSpecialColumn : NSObject

///cell标题
@property (nonatomic, strong) NSString *price_unit;

///讲述人图片URL地址
@property (nonatomic, strong) NSString *person_info;

///
@property (nonatomic, strong) NSString *image_url;

@property (nonatomic, strong) NSString *name;

@property (nonatomic, strong) NSString *last_title;

@property (nonatomic, strong) NSString *content;

@end
