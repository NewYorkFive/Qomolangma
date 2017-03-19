//
//  UILabel+DLLabel.h
//  test
//
//  Created by NowOrNever on 16/03/2017.
//  Copyright © 2017 Focus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (DLLabel)
+ (instancetype)dl_labelWithColor:(UIColor *)color andFontSize:(double)fontSize andText:(NSString *)text;
@end
