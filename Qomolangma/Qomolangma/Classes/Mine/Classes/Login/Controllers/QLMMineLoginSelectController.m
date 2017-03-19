//
//  QLMMineLoginSelectController.m
//  Qomolangma
//
//  Created by Aioria on 2017/3/16.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMMineLoginSelectController.h"
#import "QLMMineLoginController.h"
#import "QLMMineRegisterController.h"

@interface QLMMineLoginSelectController ()

@end

@implementation QLMMineLoginSelectController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI
{
    UIImageView *imageView = [[UIImageView alloc] init];
    
    imageView.image = [UIImage imageNamed:@"force_login_bg"];
    
    [self.view addSubview:imageView];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
    
    
    [self.navigationController.navigationBar setBarTintColor:[UIColor clearColor]];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(backAction:)];
    [self.navigationController.navigationBar setTintColor:[UIColor lightGrayColor]];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    

    
    UIButton *btnDismiss = [[UIButton alloc] init];
    
    [btnDismiss setBackgroundImage:[UIImage imageNamed:@"close_login"] forState:UIControlStateNormal];

    [btnDismiss addTarget:self action:@selector(btnDismissAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btnDismiss];
    
    [btnDismiss mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.bottom.offset(-20);
    }];
    
    UIButton *btnWeChart = [[UIButton alloc] init];
    
    [btnWeChart setBackgroundImage:[UIImage imageNamed:@"green_background_color_1x1_"] forState:UIControlStateNormal];
    [btnWeChart setBackgroundImage:[UIImage imageNamed:@"greenBg_1x1_"] forState:UIControlStateHighlighted];

    btnWeChart.layer.cornerRadius = 5;
    btnWeChart.layer.masksToBounds = YES;
    
    btnWeChart.titleLabel.font = [UIFont systemFontOfSize:13];
    
    [btnWeChart setImage:[UIImage imageNamed:@"wechartLogin"] forState:UIControlStateNormal];
    
    [btnWeChart setTitle:@"  微信快捷登陆" forState:UIControlStateNormal];
    
    [self.view addSubview:btnWeChart];
    
    UIButton *btnLogin = [self setButtonWithTitle:@"登陆"];
    
    [btnLogin addTarget:self action:@selector(btnLoginAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btnLogin];
    
    UIButton *btnRegister = [self setButtonWithTitle:@"注册"];
    
    [btnRegister addTarget:self action:@selector(btnRegisterAction:) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:btnRegister];
    
    [btnWeChart mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(40);
        make.right.offset(-40);
        make.height.offset(40);
        make.bottom.offset(-self.view.bounds.size.height * .5 - 3);
    }];
    
    [btnLogin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(btnWeChart);
        make.right.offset(-self.view.bounds.size.width * .5 - 3);
        make.top.equalTo(btnWeChart.mas_bottom).offset(6);
        make.height.equalTo(btnWeChart);
    }];
    
    [btnRegister mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(btnLogin.mas_right).offset(6);
        make.right.equalTo(btnWeChart);
        make.top.equalTo(btnLogin);
        make.height.equalTo(btnWeChart);
    }];
    
}

- (UIButton *)setButtonWithTitle: (NSString *)title;
{
    UIButton *button = [[UIButton alloc] init];
    
    button.backgroundColor = [UIColor colorWithWhite:1 alpha:.8];
    
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    
    button.layer.cornerRadius = 5;
    button.layer.masksToBounds = YES;
    
    [button setTitle:title forState:UIControlStateNormal];
    
    return button;
}

- (void) btnDismissAction: (UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) btnRegisterAction: (UIButton *)sender
{
    [self.navigationController pushViewController:[QLMMineRegisterController new] animated:YES];
}

- (void) btnLoginAction: (UIButton *)sender
{
    [self.navigationController pushViewController:[QLMMineLoginController new] animated:YES];
}


- (void)backAction: (UIBarButtonItem *)sender
{
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
