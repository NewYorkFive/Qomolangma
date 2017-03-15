//
//  QLMPurchasedModel.h
//  Qomolangma
//
//  Created by 王惠平 on 2017/3/15.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QLMPurchasedModel : NSObject

///已购Label 名称
@property (nonatomic,copy) NSString *tname;

///已购 id
@property (nonatomic,copy) NSString *tid;

///获取已购Label模型数据
+ (NSArray *)getPurchasedModelData;

@end
