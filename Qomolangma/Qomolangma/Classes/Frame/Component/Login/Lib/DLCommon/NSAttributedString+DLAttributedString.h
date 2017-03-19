//
//  NSAttributedString+DLAttributedString.h
//  test
//
//  Created by NowOrNever on 16/03/2017.
//  Copyright © 2017 Focus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSAttributedString (DLAttributedString)
+ (instancetype)dl_imageTextWithImage:(UIImage *)image imageWH:(CGFloat)imageWH title:(NSString *)title fontSize:(CGFloat)fontSize titleColor:(UIColor *)titleColor spacing:(CGFloat)spacing;

@end
