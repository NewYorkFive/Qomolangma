//
//  QLMMineInfo.m
//  Qomolangma
//
//  Created by Aioria on 2017/3/18.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMMineInfo.h"
#define kGender @"mineUserInfoGender"
#define kBornYear @"mineUserInfoBornYear"
#define kEducation @"mineUserInfoEducation"
#define kIndustry @"mineUserInfoIndustry"
#define kCareer @"mineUserInfoCareer"


@implementation QLMMineInfo

static QLMMineInfo *instance;

+ (void)initialize
{
    instance = [[self alloc] init];
    instance.infoDict = [NSMutableDictionary dictionary];
}

// 饿汉式单例
+ (instancetype)sharedMineInfo
{
    
    return instance;
}

@end
