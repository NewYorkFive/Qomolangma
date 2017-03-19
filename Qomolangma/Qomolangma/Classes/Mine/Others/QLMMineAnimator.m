//
//  QLMMineAnimator.m
//  Qomolangma
//
//  Created by Aioria on 2017/3/19.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMMineAnimator.h"

@interface QLMMineAnimator ()


@end

@implementation QLMMineAnimator


- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return self;
}


- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return .5;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    UIView *containerView = [transitionContext containerView];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    [containerView addSubview:toVC.view];
    
    toVC.view.layer.position = CGPointMake([UIScreen mainScreen].bounds.size.width * .5, [UIScreen mainScreen].bounds.size.height * 1.5);
    toVC.view.layer.anchorPoint = CGPointMake(.5, 1.5);
    toVC.view.transform = CGAffineTransformMakeRotation(-M_PI_2);
    
    [UIView animateWithDuration:.5 animations:^{
        toVC.view.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        toVC.view.layer.position = CGPointMake([UIScreen mainScreen].bounds.size.width * .5, [UIScreen mainScreen].bounds.size.height * .5);
        toVC.view.layer.anchorPoint = CGPointMake(.5, .5);
    }];
    
    [transitionContext completeTransition:YES];
}



@end
