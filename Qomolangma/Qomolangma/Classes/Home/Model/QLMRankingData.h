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

///图片右边的文字介绍
@property (nonatomic, strong) NSString *reader_introduce;

///讲述人图片URL地址
@property (nonatomic, strong) NSString *image_url;

///讲述人
@property (nonatomic, strong) NSString *reader_name;

///价格
@property (nonatomic, strong) NSString *price;

/////
//@property (nonatomic, strong) NSString *resource_name;

///人物小图片
@property (nonatomic, strong) NSString *reader_header_url;

@end
