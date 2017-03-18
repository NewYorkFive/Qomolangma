//
//  QLMCircleButton.m
//  Qomolangma
//
//  Created by NowOrNever on 18/03/2017.
//  Copyright © 2017 Focus. All rights reserved.
//

#import "QLMCircleButton.h"

@implementation QLMCircleButton

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    BOOL res = [super pointInside:point withEvent:event];
    if (res) {
        CGFloat newRectPointX = self.bounds.size.width * 0.5 * (1 - self.ratio);
        CGFloat newRectPointY = self.bounds.size.height * 0.5 * (1 - self.ratio);
        CGFloat newRectHeight = self.bounds.size.height * self.ratio;
        CGFloat newRectWidth  = self.bounds.size.width * self.ratio;
        UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(newRectPointX, newRectPointY, newRectWidth, newRectHeight)];
        if ([path containsPoint:point]) {
            return YES;
        }
    }
    return NO;
}


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _ratio = 1;
    }
    return self;
};


@end
