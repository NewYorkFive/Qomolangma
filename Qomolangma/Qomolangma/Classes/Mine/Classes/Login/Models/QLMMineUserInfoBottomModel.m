//
//  QLMMineUserInfoBottomModel.m
//  Qomolangma
//
//  Created by Aioria on 2017/3/19.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMMineUserInfoBottomModel.h"

@implementation QLMMineUserInfoBottomModel


+ (instancetype)mineUserInfoBottomModelWithDict: (NSDictionary *)dict
{
    QLMMineUserInfoBottomModel *model = [[QLMMineUserInfoBottomModel alloc] init];
    
    [model setValuesForKeysWithDictionary:dict];
    
    return model;
}


@end
