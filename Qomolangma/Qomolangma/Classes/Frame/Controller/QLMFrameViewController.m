//
//  QLMFrameViewController.m
//  Qomolangma
//
//  Created by NowOrNever on 15/03/2017.
//  Copyright © 2017 Focus. All rights reserved.
//

#import "QLMFrameViewController.h"
#import "QLMPlayingButton.h"
#import "QLMPlayListViewController.h"
#import "QLMNavigationController.h"
#import "QLMLoginViewController.h"
@interface QLMFrameViewController ()

@end

@implementation QLMFrameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    // Do any additional setup after loading the view.
}

- (void)setupUI{
    NSArray *vcNames = @[@"Home", @"Learn", @"Listen", @"Purchased",@"Mine"];
    NSArray *titles = @[@"发现",@"今日学习",@"随时听",@"已购",@"我的"];
    for (int i = 0; i < vcNames.count; i++) {
        [self addChildViewController:[self createComponentViewControllerWithClassName:[NSString stringWithFormat:@"QLM%@ViewController",vcNames[i]] title:titles[i] index:i+1]];
    }
    self.tabBar.tintColor = [UIColor colorWithRed: 255 / 255.0 green: 164 / 255.0 blue: 46 / 255.0 alpha:1.0];
}


- (UIViewController *)createComponentViewControllerWithClassName:(NSString *)className title:(NSString *)title index:(NSInteger)index{
    UIViewController * vc = [[NSClassFromString(className) alloc]init];
    vc.title = title;
    vc.tabBarItem.image = [[UIImage imageNamed:[NSString stringWithFormat:@"tabbar_index_%zd_30x30_",index]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"tabbar_index_select_%zd_30x30_",index]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
#warning 别改我代码!!!!!
    QLMNavigationController *navController = [[QLMNavigationController alloc]initWithRootViewController:vc];
    navController.navigationBar.tintColor = [UIColor fcs_colorWithHex:0x666666];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIViewController *vc = [((UINavigationController *)[self.childViewControllers firstObject]).childViewControllers firstObject];
//        vc.view.backgroundColor = vc.view.backgroundColor;
        [vc presentViewController:[[QLMLoginViewController alloc]init] animated:YES completion:nil];
//        [self presentViewController:[[QLMLoginViewController alloc]init] animated:YES completion:nil];
    });
//    navController.navigationBar.backgroundColor = [UIColor clearColor];
//    navController.navigationBar.translucent = YES;

    return navController;
}


@end
