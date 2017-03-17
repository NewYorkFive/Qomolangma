//
//  QLMMineRegisterController.m
//  Qomolangma
//
//  Created by Aioria on 2017/3/17.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMMineRegisterController.h"

@interface QLMMineRegisterController ()

@property (nonatomic, weak) UITextField *txtUserName;

@property (nonatomic, weak) UITextField *txtPassword;

@property (nonatomic, weak) UITextField *txtPasswordVerify;

@end

@implementation QLMMineRegisterController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupUI];
}

- (void)setupUI
{
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    self.navigationItem.titleView = [self setTitleView];
    
    UILabel *labUserName = [UILabel fcs_labelWithColor:[UIColor blackColor] andFontSize:18 andText:@"用  户  名"];
    
    [self.view addSubview:labUserName];
    
    
    self.txtUserName = [self setTextFieldWithPlaceholder:@"请输入用户名"];
    
    self.txtUserName.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    [self.view addSubview:self.txtUserName];
    
    
    UIView *lineView1 = [self setLineView];
    
    [self.view addSubview:lineView1];
    
    
    UILabel *labPassword = [UILabel fcs_labelWithColor:[UIColor blackColor] andFontSize:18 andText:@"密        码"];
    
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
    
    UILabel *labPasswordVerify = [UILabel fcs_labelWithColor:[UIColor blackColor] andFontSize:18 andText:@"确认密码"];
    
    labPasswordVerify.textAlignment = NSTextAlignmentLeft;
    
    [self.view addSubview:labPasswordVerify];
    
    
    self.txtPasswordVerify = [self setTextFieldWithPlaceholder:@"请再次输入密码"];
    
    self.txtPasswordVerify.secureTextEntry = YES;
    
    [self.view addSubview:self.txtPasswordVerify];
    
    
    UIButton *btnShowPasswordVerify = [[UIButton alloc] init];
    
    [btnShowPasswordVerify setImage:[UIImage imageNamed:@"login_password_show_22x16_"] forState:UIControlStateNormal];
    [btnShowPasswordVerify setImage:[UIImage imageNamed:@"login_password_hidden_22x16_"] forState:UIControlStateSelected];
    
    [btnShowPasswordVerify addTarget:self action:@selector(btnShowPasswordAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btnShowPasswordVerify];
    
    UIView *lineView3 = [self setLineView];
    
    [self.view addSubview:lineView3];
    

    
    UIButton *btnRegister = [[UIButton alloc] init];
    
    [btnRegister setTitle:@"注册" forState:UIControlStateNormal];
    [btnRegister setBackgroundImage:[UIImage imageNamed:@"orange_background_color_1x1_"] forState:UIControlStateNormal];
    btnRegister.layer.cornerRadius = 5;
    btnRegister.layer.masksToBounds = YES;
    btnRegister.titleLabel.font = [UIFont systemFontOfSize:15];
    [btnRegister addTarget:self action:@selector(btnRegisterAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btnRegister];
    
    UILabel *labWellcome = [UILabel fcs_labelWithColor:[UIColor blackColor] andFontSize:20 andText:@"欢迎注册得到账号"];
    
    [self.view addSubview:labWellcome];
    
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
    
    
    [labPasswordVerify mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView2.mas_bottom).offset(10);
        make.left.equalTo(labUserName);
        make.width.equalTo(labUserName);
    }];
    
    [self.txtPasswordVerify mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(labPasswordVerify);
        make.left.equalTo(labPasswordVerify.mas_right).offset(40);
        make.width.equalTo(self.txtUserName).offset(-20);
    }];
    
    [btnShowPasswordVerify mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.txtUserName);
        make.centerY.equalTo(self.txtPasswordVerify);
    }];
    
    
    [lineView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(labPasswordVerify.mas_bottom).offset(10);
        make.left.equalTo(labUserName);
        make.right.equalTo(self.txtUserName);
        make.height.offset(1 / [UIScreen mainScreen].scale);
    }];
    
    
    [btnRegister mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView3).offset(20);
        make.centerX.equalTo(lineView2);
        make.width.equalTo(lineView2);
        make.height.offset(40);
    }];
    
    [labWellcome mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(labUserName.mas_top).offset(-40);
        make.left.equalTo(labUserName);
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

- (void) btnRegisterAction: (UIButton *)sender
{
    if ([self.txtUserName.text isEqualToString:@""])
    {
        
        
    }
}

- (UIImageView *)setTitleView
{
    UIImageView *titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"register_title_image_44x22_"]];
    
    return titleView;
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
