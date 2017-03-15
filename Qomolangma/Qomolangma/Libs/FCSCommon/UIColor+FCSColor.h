//
//  UIColor+FCSColor.h
//  test
//
//  Created by NowOrNever on 16/03/2017.
//  Copyright © 2017 Focus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (FCSColor)
+ (instancetype)fcs_colorWithHex:(unsigned int) hex;
+ (instancetype)fcs_randomColor;
+ (instancetype)fcs_randomColorWithAlpha:(double)alpha;
@end
