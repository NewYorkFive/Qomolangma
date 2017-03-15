//
//  UILabel+FCSLabel.m
//  test
//
//  Created by NowOrNever on 16/03/2017.
//  Copyright © 2017 Focus. All rights reserved.
//

#import "UILabel+FCSLabel.h"

@implementation UILabel (FCSLabel)
+ (instancetype)fcs_labelWithColor:(UIColor *)color andFontSize:(double)fontSize andText:(NSString *)text{
    UILabel *label = [[UILabel alloc]init];
    label.text = text;
    label.textColor = color;
    label.font = [UIFont systemFontOfSize:fontSize];
    return label;
}
@end
