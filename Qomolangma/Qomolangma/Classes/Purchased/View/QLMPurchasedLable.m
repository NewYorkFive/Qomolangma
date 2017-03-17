//
//  QLMPurchasedLable.m
//  Qomolangma
//
//  Created by 王惠平 on 2017/3/15.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMPurchasedLable.h"

@implementation QLMPurchasedLable

- (void)setScalePercent:(CGFloat)scalePercent {
    
    _scalePercent = scalePercent;
    
    //设置颜色渐变
    //self.textColor = [UIColor colorWithRed:scalePercent green:0 blue:0 alpha:1];
   
    //  计算缩放比,最小的缩放比就是1
    CGFloat currentScalePrecent = 1 + scalePercent * 0.1;
    
    [UIView animateWithDuration: 0.45 animations: ^ {
        
        self.transform = CGAffineTransformMakeScale(currentScalePrecent, currentScalePrecent);
    }];
    
}

+ (instancetype)qlm_labelWithColor:(UIColor *)color andFontSize:(double)fontSize andText:(NSString *)text{
    QLMPurchasedLable *label = [[QLMPurchasedLable alloc]init];
    label.textAlignment = NSTextAlignmentCenter;
    label.userInteractionEnabled = YES;
    label.text = text;
    label.textColor = color;
    label.font = [UIFont systemFontOfSize:fontSize];
    return label;
}

@end
