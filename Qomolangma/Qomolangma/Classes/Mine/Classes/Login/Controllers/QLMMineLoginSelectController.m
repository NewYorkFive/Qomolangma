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
    
    [btnDismiss setBackgroundImage:[UIImage imageNamed:@"app_launch_image_bottom_375x90_"] forState:UIControlStateNormal];

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
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panAction: )];
    [self.view addGestureRecognizer:pan];
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


- (void)panAction: (UIPanGestureRecognizer *)sender
{
    CGFloat offsetX = [sender translationInView:sender.view].x;
    
    CGFloat angle = offsetX / [UIScreen mainScreen].bounds.size.width * M_PI_4;
    
    self.view.layer.position = CGPointMake([UIScreen mainScreen].bounds.size.width * .5, [UIScreen mainScreen].bounds.size.height * 1.5);
    self.view.layer.anchorPoint = CGPointMake(.5, 1.5);
    
    
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
            
            break;
        case UIGestureRecognizerStateChanged:
            self.view.transform = CGAffineTransformRotate(CGAffineTransformIdentity, angle);
            break;
            
        case UIGestureRecognizerStateFailed:
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateEnded:
            
            if (fabs(angle) > 0.37)
            {
                [self dismissViewControllerAnimated:YES completion:nil];
            }
            else
            {
                [UIView animateWithDuration:.2 animations:^{
                    self.view.transform = CGAffineTransformIdentity;
                } completion:^(BOOL finished) {
                    self.view.layer.anchorPoint = CGPointMake(.5, .5);
                    self.view.layer.position = CGPointMake(self.view.bounds.size.width * .5, self.view.bounds.size.height * .5);
                }];
            }
            break;
        default:
            break;
    }
    
}


@end
