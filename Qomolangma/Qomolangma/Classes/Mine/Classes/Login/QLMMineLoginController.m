//
//  QLMMineLoginController.m
//  Qomolangma
//
//  Created by Aioria on 2017/3/17.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMMineLoginController.h"
#import "UILabel+FCSLabel.h"

@interface QLMMineLoginController ()

@property (nonatomic, weak) UITextField *txtUserName;

@property (nonatomic, weak) UITextField *txtPassword;


@end

@implementation QLMMineLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI
{
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];

    self.title = @"登陆";
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor blackColor]}];
    
    
    UILabel *labUserName = [UILabel fcs_labelWithColor:[UIColor blackColor] andFontSize:18 andText:@"用户名"];
    
    [self.view addSubview:labUserName];
    
    
    self.txtUserName = [self setTextFieldWithPlaceholder:@"请输入用户名"];
    
    self.txtUserName.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    [self.view addSubview:self.txtUserName];
    
    
    UIView *lineView1 = [self setLineView];
    
    [self.view addSubview:lineView1];
    
    
    UILabel *labPassword = [UILabel fcs_labelWithColor:[UIColor blackColor] andFontSize:18 andText:@"密    码"];
    
    labPassword.textAlignment = NSTextAlignmentLeft;
    
    [self.view addSubview:labPassword];
    
    
    self.txtPassword = [self setTextFieldWithPlaceholder:@"请输入密码"];
    
    self.txtPassword.secureTextEntry = YES;
    
    [self.view addSubview:self.txtPassword];
    
    
    UIButton *btnShowPassword = [[UIButton alloc] init];
    
    [btnShowPassword setImage:[UIImage imageNamed:@"login_password_show_22x16_"] forState:UIControlStateNormal];
    [btnShowPassword setImage:[UIImage imageNamed:@"login_password_hidden_22x16_"] forState:UIControlStateSelected];
    
    [btnShowPassword addTarget:self action:@selector(btnShowPasswordAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btnShowPassword];
    
    UIView *lineView2 = [self setLineView];
    
    [self.view addSubview:lineView2];
    
    UIButton *btnForgetPassword = [[UIButton alloc] init];
    
    [btnForgetPassword setTitle:@"忘记密码?" forState:UIControlStateNormal];
    [btnForgetPassword setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [btnForgetPassword setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    btnForgetPassword.titleLabel.font = [UIFont systemFontOfSize:12];
    
    [self.view addSubview:btnForgetPassword];
    
    UIButton *btnLogin = [[UIButton alloc] init];
    
    [btnLogin setTitle:@"登陆" forState:UIControlStateNormal];
    [btnLogin setBackgroundImage:[UIImage imageNamed:@"orange_background_color_1x1_"] forState:UIControlStateNormal];
    btnLogin.layer.cornerRadius = 5;
    btnLogin.layer.masksToBounds = YES;
    btnLogin.titleLabel.font = [UIFont systemFontOfSize:15];
    [btnLogin addTarget:self action:@selector(btnLoginAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btnLogin];
    
    
    [labUserName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(150);
        make.left.offset(20);
    }];
    
    [self.txtUserName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(labUserName);
        make.left.equalTo(labUserName.mas_right).offset(40);
        make.right.offset(-20);
    }];

    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(labUserName.mas_bottom).offset(10);
        make.left.equalTo(labUserName);
        make.right.equalTo(self.txtUserName);
        make.height.offset(1 / [UIScreen mainScreen].scale);
    }];
    
    [labPassword mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView1.mas_bottom).offset(10);
        make.left.equalTo(labUserName);
        make.width.equalTo(labUserName);
    }];
    
    [self.view layoutIfNeeded];
    
    [self.txtPassword mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(labPassword);
        make.left.equalTo(labPassword.mas_right).offset(40);
        make.width.equalTo(self.txtUserName).offset(-20);
    }];
    
    [btnShowPassword mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.txtUserName);
        make.centerY.equalTo(self.txtPassword);
    }];
    
    [lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(labPassword.mas_bottom).offset(10);
        make.left.equalTo(labUserName);
        make.right.equalTo(self.txtUserName);
        make.height.offset(1 / [UIScreen mainScreen].scale);
    }];
    
    [btnForgetPassword mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView2).offset(10);
        make.right.equalTo(lineView2);
    }];
    
    [btnLogin mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView2).offset(50);
        make.centerX.equalTo(lineView2);
        make.width.equalTo(lineView2);
        make.height.offset(40);
    }];
    
}

- (UIView *) setLineView
{
    UIView *lineView = [[UIView alloc] init];
    
    lineView.backgroundColor = [UIColor colorWithWhite:.8 alpha:.6];
    
    return lineView;
}
- (UITextField *) setTextFieldWithPlaceholder: (NSString *)placeholder
{
    UITextField *textField = [[UITextField alloc] init];
    
    textField.placeholder = placeholder;
    
    textField.font = [UIFont systemFontOfSize:16];
    
    return textField;
}

- (void) btnShowPasswordAction: (UIButton *)sender
{
    sender.selected = !sender.selected;
    
    if (sender.selected)
    {
        self.txtPassword.secureTextEntry = NO;
    }
    else
    {
        self.txtPassword.secureTextEntry = YES;
    }
}

- (void) btnLoginAction: (UIButton *)sender
{
    if ([self.txtUserName.text isEqualToString:@""])
    {
        
        
    }
    

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
