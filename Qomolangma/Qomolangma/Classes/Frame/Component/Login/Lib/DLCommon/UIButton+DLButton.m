//
//  UIButton+DLButton.m
//
//  Created by NowOrNever on 10/02/2017.
//  Copyright © 2017 NowOrNever. All rights reserved.
//

#import "UIButton+DLButton.h"

@implementation UIButton (DLButton)

+ (instancetype)dl_textButton:(NSString *)title fontSize:(CGFloat)fontSize normalColor:(UIColor *)normalColor selectedColor:(UIColor *)selectedColor {
    
    UIButton *button = [[self alloc] init];
    
    [button setTitle:title forState:UIControlStateNormal];
    
    [button setTitleColor:normalColor forState:UIControlStateNormal];
    [button setTitleColor:selectedColor forState:UIControlStateSelected];
    
    button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    
    [button sizeToFit];
    
    return button;
}

@end
