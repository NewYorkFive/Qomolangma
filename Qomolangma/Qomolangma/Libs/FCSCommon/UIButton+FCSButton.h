//
//  UIButton+FCSButton.h
//  test
//
//  Created by NowOrNever on 16/03/2017.
//  Copyright © 2017 Focus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (FCSButton)
/// 创建文本按钮
///
/// @param title         文本
/// @param fontSize      字体大小
/// @param normalColor   默认颜色
/// @param selectedColor 选中颜色
///
/// @return UIButton
+ (instancetype)fcs_textButton:(NSString *)title fontSize:(CGFloat)fontSize normalColor:(UIColor *)normalColor selectedColor:(UIColor *)selectedColor;

+ (instancetype)fcs_buttonWithImageName:(NSString *)imageName;
+ (instancetype)fcs_buttonWithImageName:(NSString *)imageName highlightedImageName:(NSString *) highlightedImageName;
+ (instancetype)fcs_buttonWithImageName:(NSString *)imageName selectedImageName:(NSString *) selectedImageName;
+ (instancetype)fcs_buttonWithImageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName highlightedImageName:(NSString *)highlightedImageName;
@end
