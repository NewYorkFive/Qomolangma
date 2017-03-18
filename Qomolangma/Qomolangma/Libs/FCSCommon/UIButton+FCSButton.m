//
//  UIButton+FCSButton.m
//  test
//
//  Created by NowOrNever on 16/03/2017.
//  Copyright © 2017 Focus. All rights reserved.
//

#import "UIButton+FCSButton.h"
#import "NSAttributedString+FCSAttributedString.h"
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
    return [self fcs_buttonWithImageName:imageName selectedImageName:selectedImageName highlightedImageName:highlightedImageName disableImageName:nil];
}

+ (instancetype)fcs_buttonWithImageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName highlightedImageName:(NSString *)highlightedImageName disableImageName:(NSString *)disableImageName andTitle:(NSString *)title{
    
    
    UIButton *button = [[self alloc] init];
    
    
    
//    NSAttributedString *attr = [NSAttributedString fcs_imageTextWithImage:<#(UIImage *)#> imageWH:<#(CGFloat)#> title:<#(NSString *)#> fontSize:<#(CGFloat)#> titleColor:<#(UIColor *)#> spacing:<#(CGFloat)#>]
    return button;
}
//NSAttributedString *attrString = [NSAttributedString cz_imageTextWithImage:[UIImage imageNamed:imageName] imageWH:40 title:title fontSize:15 titleColor:[UIColor whiteColor] spacing:7];
//
////    btn.tag = HMTopViewButtonTypePay;
//
//[btn setAttributedTitle:attrString forState:UIControlStateNormal];
//
//// 设置按钮的tag(枚举的类型)
//btn.tag = type;
//
//// 本质上,这个按钮设置的是字符串, 如果是上下,需要换行, 设置numberOfLines为0 . 居中的关键词(对齐Alignment)
//btn.titleLabel.numberOfLines = 0;
//btn.titleLabel.textAlignment = NSTextAlignmentCenter;

- (instancetype)fcs_buttonImageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName highlightedImageName:(NSString *)highlightedImageName disableImageName:(NSString *)disableImageName{
//    [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    if (selectedImageName && [UIImage imageNamed:selectedImageName]) {
        [self setImage:[UIImage imageNamed:selectedImageName] forState:UIControlStateSelected];
    }
    if (highlightedImageName && [UIImage imageNamed:highlightedImageName]) {
        [self setImage:[UIImage imageNamed:highlightedImageName]forState:UIControlStateHighlighted];
    }
    if (disableImageName && [UIImage imageNamed:disableImageName]) {
        [self setImage:[UIImage imageNamed:disableImageName] forState:UIControlStateDisabled];
    }
    [self sizeToFit];
    return self;
}


+ (instancetype)fcs_buttonWithImageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName highlightedImageName:(NSString *)highlightedImageName disableImageName:(NSString *)disableImageName{
    UIButton *button = [[self alloc]init];
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    if (selectedImageName && [UIImage imageNamed:selectedImageName]) {
        [button setImage:[UIImage imageNamed:selectedImageName] forState:UIControlStateSelected];
    }
    if (highlightedImageName && [UIImage imageNamed:highlightedImageName]) {
        [button setImage:[UIImage imageNamed:highlightedImageName]forState:UIControlStateHighlighted];
    }
    if (disableImageName && [UIImage imageNamed:disableImageName]) {
        [button setImage:[UIImage imageNamed:disableImageName] forState:UIControlStateDisabled];
    }
    [button sizeToFit];
    return button;
}

@end
