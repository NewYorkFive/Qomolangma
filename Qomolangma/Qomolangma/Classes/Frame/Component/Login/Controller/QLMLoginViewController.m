//
//  QLMLoginViewController.m
//  Qomolangma
//
//  Created by NowOrNever on 18/03/2017.
//  Copyright © 2017 Focus. All rights reserved.
//

#import "QLMLoginViewController.h"
#import "DLCycleView.h"
@interface QLMLoginViewController ()

@end

@implementation QLMLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
}
- (void)setupUI{
    self.view.backgroundColor = [UIColor blueColor];
    
    NSMutableArray *mArr = [NSMutableArray array];
    for (int i = 1; i < 4; i++) {
        [mArr addObject:[NSString stringWithFormat:@"launch_default_image_%zd",i]];
//        [mArr addObject:[NSURL URLWithString:]];
    }
    DLCycleView *cycleView = [[DLCycleView alloc]initWithFrame:kScreenBounds];
    cycleView.imageNames = mArr.copy;
    cycleView.pageControlRatio = 0.75;
    [self.view addSubview:cycleView];
    
//    [cycleView layoutIfNeeded];
//    [cycleView mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(cycleView.bounds.size.height *  0.6);
//    }];
    
//    [cycleView.pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
//    }];
  
    UIView *bottomView = [[UIView alloc]init];
//    UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, kScreenHeight * cycleView.pageControlRatio + 10, kScreenWidth, kScreenHeight - )];
//    bottomView.backgroundColor = [UIColor colorWithRed: 1 / 255.0 green: 150 / 255.0 blue: 1  alpha: 1];
    [self.view addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(kScreenHeight * cycleView.pageControlRatio + 10);
        make.bottom.right.left.equalTo(self.view);
    }];
    [self.view layoutIfNeeded];
    
    
    NSMutableArray<UIButton *> *btns = [NSMutableArray array];
    for (int i = 0; i < 3; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [bottomView addSubview:btn];
        [btns addObject:btn];
    }
    
//    UIColor *color = [UIColor fcs_colorWithHex:0xffa42e];
    
    [btns[0] setBackgroundImage:[UIImage imageNamed:@"register"] forState:UIControlStateNormal];
    [btns[0] addTarget:self action:@selector(signUpClick) forControlEvents:UIControlEventTouchUpInside];
    
    [btns[1] setBackgroundImage:[UIImage imageNamed:@"Login"] forState:UIControlStateNormal];
    [btns[1] setTitle:@"登陆" forState:UIControlStateNormal];
    [btns[1] setTitleColor:[UIColor fcs_colorWithHex:0xffa42e] forState:UIControlStateNormal];
    [btns[1] addTarget:self action:@selector(loginClick) forControlEvents:UIControlEventTouchUpInside];
    
    [btns[2] setTitle:@"随便看看" forState:UIControlStateNormal];
    [btns[2] setTitleColor:[UIColor fcs_colorWithHex:0xb7b7b7] forState:UIControlStateNormal];
    [btns[2] addTarget:self action:@selector(lookAroundClick) forControlEvents:UIControlEventTouchUpInside];
    
    [btns mas_distributeViewsAlongAxis:MASAxisTypeVertical withFixedSpacing:5 leadSpacing:10 tailSpacing:10];
    [btns mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(bottomView.bounds.size.width * 0.8);
        make.centerX.equalTo(bottomView);
    }];
    
    
    
}


- (void)loginClick{
    NSLog(@"Login");
}

- (void)signUpClick{
    NSLog(@"Sing up");
}

- (void)lookAroundClick{
    self.parentViewController.tabBarController.selectedIndex = 2;
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
