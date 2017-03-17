//
//  UILabel+HMAdditions.m
//  01-生活圈
//
//  Created by apple on 17/1/4.
//  Copyright © 2017年 itheima. All rights reserved.
//

#import "UILabel+HMAdditions.h"

@implementation UILabel (HMAdditions)

+ (instancetype)hm_labelWithTextColor:(UIColor *)textColor andFontSize:(NSInteger)fontSize andText:(NSString *)text {
    UILabel *label = [[self alloc] init];
    label.text = text;
    label.font = [UIFont systemFontOfSize:fontSize];
    label.textColor = textColor;
    return label;
}

@end
