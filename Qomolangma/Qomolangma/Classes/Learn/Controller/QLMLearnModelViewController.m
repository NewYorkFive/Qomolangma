//
//  QLMLearnModelViewController.m
//  Qomolangma
//
//  Created by 刘康 on 2017/3/18.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMLearnModelViewController.h"
#import "QLMPresntViewController.h"

@interface QLMLearnModelViewController ()<UIViewControllerTransitioningDelegate>

@end

@implementation QLMLearnModelViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        //1.告诉系统我们要自定义转场
        self.modalPresentationStyle = UIModalPresentationCustom;
        
        //2.设置转场的代理
        self.transitioningDelegate = self;
    }
    
    return self;
}

//给系统提供 你要自定义的转场控制器
- (nullable UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(nullable UIViewController *)presenting sourceViewController:(UIViewController *)source {

    return [[QLMPresntViewController alloc] initWithPresentedViewController:presented presentingViewController:source];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
        
}



@end
