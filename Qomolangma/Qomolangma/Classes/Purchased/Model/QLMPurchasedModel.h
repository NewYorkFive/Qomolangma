//
//  QLMPurchasedModel.h
//  Qomolangma
//
//  Created by 王惠平 on 2017/3/15.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QLMPurchasedModel : NSObject

///标签数据 - 初次用到 - 已无用
///已购Label 名称
@property (nonatomic,copy) NSString *tname;

///已购 id
@property (nonatomic,copy) NSString *tid;



@property(nonatomic,copy) NSString * price_unit;
@property (nonatomic, copy) NSString *person_info;
@property (nonatomic, copy) NSString *author;
@property (nonatomic, copy) NSString *image_url;
@property (nonatomic, assign) NSInteger price;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *modelId;
@property (nonatomic, copy) NSString *content;


///获取已购Label模型数据
+ (NSArray *)getPurchasedModelData;

@end
