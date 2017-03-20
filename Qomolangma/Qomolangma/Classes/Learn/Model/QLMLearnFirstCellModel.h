//
//  QLMLearnFirstCellModel.h
//  Qomolangma
//
//  Created by 刘康 on 2017/3/19.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QLMLearnFirstCellModel : NSObject

/**
 单价
 */
@property(nonatomic,copy) NSString * price_unit;

/**
 个人info
 */
@property (nonatomic, copy) NSString *person_info;

/**
 作者
 */
@property (nonatomic, copy) NSString *author;


/**
 图片url
 */
@property (nonatomic, copy) NSString *image_url;

/**
 价格
 */
@property (nonatomic, assign) NSInteger price;

/**
 名称
 */
@property (nonatomic, copy) NSString *name;

/**
 model的id
 */
@property (nonatomic, assign) NSInteger *modelId;

/**
 内容
 */
@property (nonatomic, copy) NSString *content;

/**
 订阅数
 */
@property(nonatomic,assign) NSInteger subscribe_count;

@end
