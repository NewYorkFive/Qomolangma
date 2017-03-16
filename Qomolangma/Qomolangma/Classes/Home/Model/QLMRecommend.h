//
//  QLMRecommend.h
//  Qomolangma
//
//  Created by 张晨晖 on 2017/3/16.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QLMRecommend : NSObject

@property (nonatomic ,strong) NSString *image_url;

//可以打开的网址.可能为nil,应该根据是否为nil开关点击事件
@property (nonatomic ,strong) NSString *content_url;

@end
