//
//  QLMPurchasedLable.h
//  Qomolangma
//
//  Created by 王惠平 on 2017/3/15.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QLMPurchasedLable : UILabel

@property (nonatomic,assign) CGFloat scalePercent;

+ (instancetype)qlm_labelWithColor:(UIColor *)color andFontSize:(double)fontSize andText:(NSString *)text;

@end
