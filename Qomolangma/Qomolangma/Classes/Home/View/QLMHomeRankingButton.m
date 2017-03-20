//
//  QLMHomeRankingButton.m
//  Qomolangma
//
//  Created by Aioria on 2017/3/18.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMHomeRankingButton.h"
//#import <UIImageView+WebCache.h>
#import <UIButton+WebCache.h>

@implementation QLMHomeRankingButton

- (void)setRankingData:(QLMRankingData *)rankingData {
    
    _rankingData = rankingData;
    //数据放到图形上
    [self sd_setImageWithURL:[NSURL URLWithString:rankingData.image_url] forState:UIControlStateNormal];
    
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

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {

    {
        
        CGFloat width = CGRectGetWidth(self.bounds);

        CGRect rect = CGRectMake(0, 0, width, 200);
        return CGRectContainsPoint(rect, point);
    }
}

@end
