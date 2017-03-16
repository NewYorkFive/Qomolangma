//
//  UIButton+FCSButton.m
//  test
//
//  Created by NowOrNever on 16/03/2017.
//  Copyright © 2017 Focus. All rights reserved.
//

#import "UIButton+FCSButton.h"

@implementation UIButton (FCSButton)
+ (instancetype)fcs_textButton:(NSString *)title fontSize:(CGFloat)fontSize normalColor:(UIColor *)normalColor selectedColor:(UIColor *)selectedColor{
    UIButton *button = [[self alloc] init];
    
    [button setTitle:title forState:UIControlStateNormal];
    
    [button setTitleColor:normalColor forState:UIControlStateNormal];
    [button setTitleColor:selectedColor forState:UIControlStateSelected];
    
    button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    
    [button sizeToFit];
    
    return button;
}

+ (instancetype)fcs_buttonWithImageName:(NSString *)imageName{
    return [self fcs_buttonWithImageName:imageName selectedImageName:nil highlightedImageName:nil];
}

+ (instancetype)fcs_buttonWithImageName:(NSString *)imageName highlightedImageName:(NSString *)highlightedImageName{
    return [self fcs_buttonWithImageName:imageName selectedImageName:nil highlightedImageName:highlightedImageName];
}

+ (instancetype)fcs_buttonWithImageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName{
    return [self fcs_buttonWithImageName:imageName selectedImageName:selectedImageName highlightedImageName:nil];
}

+ (instancetype)fcs_buttonWithImageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName highlightedImageName:(NSString *)highlightedImageName{
    UIButton *button = [[self alloc]init];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    if (selectedImageName) {
        [button setImage:[UIImage imageNamed:selectedImageName] forState:UIControlStateSelected];
    }
    if (highlightedImageName) {
        [button setImage:[UIImage imageNamed:highlightedImageName]forState:UIControlStateHighlighted];
    }
    return button;
}


@end
