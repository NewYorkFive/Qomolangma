//
//  QLMMineRegisterController.m
//  Qomolangma
//
//  Created by Aioria on 2017/3/17.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMMineRegisterController.h"
#import <AVOSCloud/AVOSCloud.h>

@interface QLMMineRegisterController () <UITextFieldDelegate>

@property (nonatomic, weak) UITextField *txtUserName;

@property (nonatomic, weak) UITextField *txtPassword;

@property (nonatomic, weak) UITextField *txtPasswordVerify;

@end


@implementation QLMMineRegisterController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupUI];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [AVAnalytics beginLogPageView:@"SignUpView"];
    [self.txtUserName becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [AVAnalytics endLogPageView:@"SignUpView"];
}


- (void)setupUI
{
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    self.navigationItem.titleView = [self setTitleView];
    
    UILabel *labUserName = [UILabel fcs_labelWithColor:[UIColor blackColor] andFontSize:18 andText:@"用  户  名"];
    
    [self.view addSubview:labUserName];
    
    
    self.txtUserName = [self setTextFieldWithPlaceholder:@"请输入用户名"];
    
    self.txtUserName.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.txtUserName.tintColor = [UIColor blackColor];
    
    [self.view addSubview:self.txtUserName];
    
    
    UIView *lineView1 = [self setLineView];
    
    [self.view addSubview:lineView1];
    
    
    UILabel *labPassword = [UILabel fcs_labelWithColor:[UIColor blackColor] andFontSize:18 andText:@"密        码"];
    
    labPassword.textAlignment = NSTextAlignmentLeft;
    
    [self.view addSubview:labPassword];
    
    
    self.txtPassword = [self setTextFieldWithPlaceholder:@"请输入密码"];
    
    self.txtPassword.delegate = self;
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
    self.txtPasswordVerify.delegate = self;
    
    [self.view addSubview:self.txtPasswordVerify];
    
    
    UIButton *btnShowPasswordVerify = [[UIButton alloc] init];
    btnShowPasswordVerify.hidden = YES;
    
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
    
    lineView.backgroundColor = [UIColor colorWithWhite:.8 alpha:.8];
    
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
        self.txtPasswordVerify.secureTextEntry = NO;
    }
    else
    {
        self.txtPassword.secureTextEntry = YES;
        self.txtPasswordVerify.secureTextEntry = YES;
    }
}

- (void) btnRegisterAction: (UIButton *)sender
{
    if ([self.txtUserName.text isEqualToString:@""] || self.txtUserName.text.length == 0 || self.txtUserName.text == nil)
    {
        [SVProgressHUD showErrorWithStatus:@"请输入用户名"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
        });
        return;
    }
    else if ([self.txtPassword.text isEqualToString:@""] || self.txtPassword.text.length == 0 || self.txtPassword.text == nil)
    {
        [SVProgressHUD showErrorWithStatus:@"请输入密码"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
        });
        return;
    }
    else if (self.txtPassword.text.length < 6)
    {
        [SVProgressHUD showErrorWithStatus:@"密码过于简单"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
        });
        return;
    }
    else if (![self.txtPassword.text isEqualToString:self.txtPasswordVerify.text])
    {
        [SVProgressHUD showErrorWithStatus:@"两次密码输入不一致"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [SVProgressHUD dismiss];
        });
        return;
    }
    

    
    AVUser *user = [AVUser user];
    user.username = self.txtUserName.text;
    user.password = self.txtPassword.text;
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            [[NSUserDefaults standardUserDefaults] setObject:self.txtUserName.text forKey:kUserName];
            [[NSUserDefaults standardUserDefaults] setObject:self.txtPassword.text forKey:kPassWord];
            
            [QLMMineInfo sharedMineInfo].isLogin = YES;
            
            [SVProgressHUD showSuccessWithStatus:@"注册成功"];
            [self.navigationController dismissViewControllerAnimated:NO completion:nil];
        } else {
            
            [SVProgressHUD showErrorWithStatus:@"用户名已注册"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [SVProgressHUD dismiss];
            });
            
            self.txtUserName.text = @"";
            self.txtPassword.text = @"";
            self.txtPasswordVerify.text = @"";
        }
    }];

    

}

- (UIImageView *)setTitleView
{
    UIImageView *titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"register_title_image_44x22_"]];
    
    return titleView;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{

    if (textField == self.txtPassword || textField == self.txtPasswordVerify)
    {

        if (range.location < 5)
        {
            textField.textColor = [UIColor redColor];
            textField.tintColor = [UIColor redColor];
            
        }
        else
        {
            textField.textColor = [UIColor blackColor];
            textField.tintColor = [UIColor blackColor];
        }
        
    }
    return YES;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
        if (self.txtUserName.text.length < 1)
        {
            [SVProgressHUD showErrorWithStatus:@"请输入用户名"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [SVProgressHUD dismiss];
            });
            return NO;
        }
        else if (textField == self.txtPasswordVerify && self.txtPassword.text.length == 0)
        {
            [SVProgressHUD showErrorWithStatus:@"请输入密码"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [SVProgressHUD dismiss];
            });
            return NO;
        }
        else if (textField == self.txtPasswordVerify && self.txtPassword.text.length < 6)
        {
            [SVProgressHUD showErrorWithStatus:@"密码过于简单"];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [SVProgressHUD dismiss];
            });
            return NO;
        }
    return YES;
}





@end
