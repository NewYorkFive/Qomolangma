//
//  QLMRecommendButton.m
//  Qomolangma
//
//  Created by 张晨晖 on 2017/3/19.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMRecommendButton.h"
#import <UIButton+WebCache.h>

@implementation QLMRecommendButton

- (void)setRecommend:(QLMRecommend *)recommend {
    
    _recommend = recommend;
    //把数据放到控件上
    [self sd_setImageWithURL:[NSURL URLWithString:recommend.image_url] forState:UIControlStateNormal];
    //点击高亮屏蔽
    [self sd_setImageWithURL:[NSURL URLWithString:recommend.image_url] forState:UIControlStateHighlighted];
    
}

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]){
        [self setupUI];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self setupUI];
}

- (void)setupUI {
    
}

//- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
//    
//    {
//        CGRect bounds = self.bounds;
//        
//        CGFloat width = CGRectGetWidth(self.bounds);
//        //若原热区小于44x44，则放大热区，否则保持原大小不变
//        //        CGFloat width = CGRectGetWidth(self.bounds);
//        //        CGFloat heightDelta = MAX(180.0 - bounds.size.height, 0);
//        bounds = CGRectMake(0, 0, width, 200);
//        return CGRectContainsPoint(bounds, point);
//    }
//}

@end
