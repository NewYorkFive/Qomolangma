//
//  QLMRectButton.m
//  Qomolangma
//
//  Created by NowOrNever on 18/03/2017.
//  Copyright © 2017 Focus. All rights reserved.
//

#import "QLMRectButton.h"

@interface QLMRectButton ()
@end

@implementation QLMRectButton


- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    BOOL res = [super pointInside:point withEvent:event];
    if (res) {
        CGFloat newRectPointX = self.bounds.size.width * 0.5 * (1 - self.ratio);
        CGFloat newRectPointY = self.bounds.size.height * 0.5 * (1 - self.ratio);
        CGFloat newRectHeight = self.bounds.size.height * self.ratio;
        CGFloat newRectWidth  = self.bounds.size.width * self.ratio;
        UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(newRectPointX, newRectPointY, newRectWidth, newRectHeight)];
        if ([path containsPoint:point]) {
            return YES;
        }
    }
    return NO;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.ratio = 1;
    }
    return self;
};


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
