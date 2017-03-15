//
//  UIViewController+FCSViewController.m
//  test
//
//  Created by NowOrNever on 16/03/2017.
//  Copyright © 2017 Focus. All rights reserved.
//

#import "UIViewController+FCSViewController.h"

@implementation UIViewController (FCSViewController)
- (void)fcs_addChildController:(UIViewController *)childController intoView:(UIView *)view{
    // 1> 添加子控制器 － 否则响应者链条会被打断，导致事件无法正常传递，而且错误非常难改！
    [self addChildViewController:childController];
    
    // 2> 添加子控制器的视图
    [view addSubview:childController.view];
    
    // 3> 完成子控制器的添加
    [childController didMoveToParentViewController:self];
}
@end
