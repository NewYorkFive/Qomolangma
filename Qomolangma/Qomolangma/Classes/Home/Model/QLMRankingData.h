//
//  QLMRankingData.h
//  Qomolangma
//
//  Created by 张晨晖 on 2017/3/16.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import <Foundation/Foundation.h>

//热门排行榜
@interface QLMRankingData : NSObject

///cell标题
@property (nonatomic, strong) NSString *resource_content;

///讲述人图片URL地址
@property (nonatomic, strong) NSString *image_url;

///
@property (nonatomic, strong) NSString *resource_name;

@end
