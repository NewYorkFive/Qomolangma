//
//  QLMHomeRankingButton.m
//  Qomolangma
//
//  Created by Aioria on 2017/3/18.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMHomeRankingButton.h"

@implementation QLMHomeRankingButton

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {

    {
        CGRect bounds = self.bounds;
        
        CGFloat width = CGRectGetWidth(self.bounds);
        //若原热区小于44x44，则放大热区，否则保持原大小不变
//        CGFloat width = CGRectGetWidth(self.bounds);
//        CGFloat heightDelta = MAX(180.0 - bounds.size.height, 0);
        bounds = CGRectMake(0, 0, width, 200);
        return CGRectContainsPoint(bounds, point);
    }
}

@end
