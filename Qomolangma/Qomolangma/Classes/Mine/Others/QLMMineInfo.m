//
//  QLMMineInfo.m
//  Qomolangma
//
//  Created by Aioria on 2017/3/18.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMMineInfo.h"

@implementation QLMMineInfo

static id instance;

+ (void)initialize
{
    instance = [[self alloc] init];
}

// 饿汉式单例
+ (instancetype)sharedMineInfo
{
    return instance;
}

@end
