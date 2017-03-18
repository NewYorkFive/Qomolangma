//
//  QLMCarousel.h
//  Qomolangma
//
//  Created by 张晨晖 on 2017/3/17.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import <Foundation/Foundation.h>

//无线轮播图
@interface QLMCarousel : NSObject

//图片地址
@property (nonatomic ,strong) NSString *image_url;

//点击跳转地址
@property (nonatomic ,strong) NSString *content_url;

@end
