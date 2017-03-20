//
//  QLMMineConfirmExitController.m
//  Qomolangma
//
//  Created by Aioria on 2017/3/19.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMMineConfirmExitController.h"
#import "QLMMineConfirmEximPresentationController.h"
#import "QLMLoginViewController.h"


@interface QLMMineConfirmExitController () <UIViewControllerTransitioningDelegate>

@end

@implementation QLMMineConfirmExitController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])
    {
        self.modalPresentationStyle = UIModalPresentationCustom;
        self.transitioningDelegate = self;
    }
    return self;
}

- (nullable UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(nullable UIViewController *)presenting sourceViewController:(UIViewController *)source
{
    QLMMineConfirmEximPresentationController *presentationC = [[QLMMineConfirmEximPresentationController alloc]initWithPresentedViewController:presented presentingViewController:presenting];
    
    return presentationC;
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btnCancel = [[UIButton alloc] init];
    
    [btnCancel setBackgroundImage:[UIImage imageNamed:@"dark_gray_background_color_1x1_"] forState:UIControlStateNormal];
    
    btnCancel.layer.cornerRadius = 5;
    btnCancel.layer.masksToBounds = YES;
    
    [btnCancel setTitle:@"取消" forState:UIControlStateNormal];
    
    [btnCancel addTarget:self action:@selector(btnCancelAction: ) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btnCancel];
    
    UIView *viewLine = [[UIView alloc] init];
    
    viewLine.backgroundColor = [UIColor colorWithWhite:.7 alpha:.7];
    
    [self.view addSubview:viewLine];

    UIButton *btnExit = [[UIButton alloc] init];
    
    btnExit.layer.cornerRadius = 5;
    btnExit.layer.masksToBounds = YES;
    
    [btnExit setBackgroundImage:[UIImage imageNamed:@"orange_background_color_1x1_"] forState:UIControlStateNormal];
    
    [btnExit setTitle:@"退出登陆" forState:UIControlStateNormal];
    
    [btnExit addTarget:self action:@selector(btnExitAction: ) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btnExit];
    
    UILabel *labDescription = [UILabel fcs_labelWithColor:[UIColor grayColor] andFontSize:12 andText:@"退出后将删除全部本地数据,请慎重退出"];
    
    labDescription.numberOfLines = 0;
    
    labDescription.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:labDescription];
    
     [btnCancel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset(-10);
        make.left.offset(20);
        make.right.offset(-20);
        make.height.offset(40);
    }];
    
    [viewLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.view);
        make.bottom.equalTo(btnCancel.mas_top).offset(-10);
        make.height.offset(1 / [UIScreen mainScreen].scale);
    }];
    
    [btnExit mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(btnCancel);
        make.bottom.equalTo(viewLine.mas_top).offset(-10);
        make.left.equalTo(btnCancel);
        make.height.equalTo(btnCancel);
    }];
    
    [labDescription mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(btnCancel);
        make.bottom.equalTo(btnExit.mas_top).offset(-10);
        make.left.equalTo(btnCancel);
    }];
    
    
}

 - (void) btnCancelAction: (UIButton *)sender
 {
     [self dismissViewControllerAnimated:YES completion:nil];
 }

- (void) btnExitAction: (UIButton *)sender
{
    QLMLoginViewController *loginVC = [[QLMLoginViewController alloc] init];
    [self presentViewController:loginVC animated:YES completion:nil];
}

@end
