//
//  UIColor+FCSColor.m
//  test
//
//  Created by NowOrNever on 16/03/2017.
//  Copyright © 2017 Focus. All rights reserved.
//

#import "UIColor+FCSColor.h"

@implementation UIColor (FCSColor)
+ (instancetype)fcs_colorWithHex:(unsigned int) hex{
    int red     = (hex & 0xff0000) >> 16;
    int green   = (hex & 0x00ff00) >> 8;
    int blue    = (hex & 0x0000ff);
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1];
}

+ (instancetype)fcs_randomColor{
    return [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1];
}

+ (instancetype)fcs_randomColorWithAlpha:(double)alpha{
    return [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:alpha];
}
@end
