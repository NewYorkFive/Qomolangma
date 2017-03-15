//
//  QLMFrameViewController.m
//  Qomolangma
//
//  Created by NowOrNever on 15/03/2017.
//  Copyright © 2017 Focus. All rights reserved.
//

#import "QLMFrameViewController.h"

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
    UINavigationController *navController = [[UINavigationController alloc]initWithRootViewController:vc];
    return navController;
}
         
@end
