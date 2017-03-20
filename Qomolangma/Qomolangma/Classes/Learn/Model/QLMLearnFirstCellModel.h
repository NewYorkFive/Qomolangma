//
//  QLMLearnFirstCellModel.h
//  Qomolangma
//
//  Created by 刘康 on 2017/3/19.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QLMLearnFirstCellModel : NSObject

///价格单位
@property(nonatomic,copy) NSString * price_unit;
///作者简介
@property (nonatomic, copy) NSString *person_info;
///人名
@property (nonatomic, copy) NSString *author;
///图片地址
@property (nonatomic, copy) NSString *image_url;
///价格
@property (nonatomic, assign) NSInteger price;
///标题
@property (nonatomic, copy) NSString *name;
///id
@property (nonatomic, assign) NSInteger *modelId;
///文本介绍
@property (nonatomic, copy) NSString *content;
///已读个数
@property(nonatomic,assign) NSInteger subscribe_count;

@end
