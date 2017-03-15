//
//  QLMPurchasedModel.m
//  Qomolangma
//
//  Created by 王惠平 on 2017/3/15.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMPurchasedModel.h"
#import <YYModel.h>

@implementation QLMPurchasedModel

+ (NSArray *)getPurchasedModelData {
    
    
    //获取json路径
    NSString *jsonPath = [[NSBundle mainBundle] pathForResource:@"purchase.json" ofType:nil];
    
    //获取json文件对应的二进制数据
    NSData *jsonData = [NSData dataWithContentsOfFile:jsonPath];
    
    //反序列化
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:NULL];
    
    //获取tlist对应的数组字典数据
    NSArray *purchasedDicArray = [dic objectForKey:@"tList"];
    
    //使用YYModel完成字典转模型
    NSArray *modelArray = [NSArray yy_modelArrayWithClass:[QLMPurchasedModel class] json:purchasedDicArray];
    
    //根据模型里的tid进行排序
    modelArray = [modelArray sortedArrayUsingComparator:^NSComparisonResult(  QLMPurchasedModel *obj1, QLMPurchasedModel *obj2) {
        
        return [obj1.tid compare:obj2.tid];
        
    }];
    
    return modelArray;
    
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ - %@", self.tid,self.tname];
}

@end
