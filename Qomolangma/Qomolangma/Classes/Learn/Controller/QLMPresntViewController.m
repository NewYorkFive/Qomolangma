//
//  QLMPresntViewController.m
//  Qomolangma
//
//  Created by 刘康 on 2017/3/18.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMPresntViewController.h"

@interface QLMPresntViewController ()

@end

@implementation QLMPresntViewController

//容器视图 将要布局子控件
- (void)containerViewWillLayoutSubviews {
    
    
    //1.获取容器视图
    UIView *contanerView = self.containerView;
    
    //2.获取展示的控制器的View
    UIView *presentedView = self.presentedView;
    
    [contanerView addSubview:presentedView];
    
    //3.修改展示控制器的VIew的frame 或者  mas
    [presentedView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.bottom.equalTo(contanerView);
        make.height.mas_equalTo(150);
    }];
    //布局控件
    UILabel *noticeLabel = [UILabel fcs_labelWithColor:[UIColor grayColor] andFontSize:16 andText:@"您将订阅2017-03-18至2017-04-18的内容"];
    UIButton *payBtn = [UIButton new];
    [payBtn setTitle:@"余额支付" forState:UIControlStateNormal];
    payBtn.backgroundColor = [UIColor orangeColor];
    UIButton *cancelBtn = [UIButton new];
    cancelBtn.backgroundColor = [UIColor grayColor];
    [cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    
    [presentedView addSubview:noticeLabel];
    [presentedView addSubview:payBtn];
    [presentedView addSubview:cancelBtn];
    
    [noticeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(presentedView).offset(10);
        make.centerX.equalTo(presentedView);
    }];
    [payBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(noticeLabel.mas_bottom).offset(20);
        make.left.offset(10);
        make.right.offset(-10);
    }];
    [cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(payBtn.mas_bottom).offset(10);
        make.left.offset(10);
        make.right.offset(-10);
    }];

    //4.设置蒙版 改变透明度
    UIView *dimView = [[UIView alloc] init];
    dimView.backgroundColor = [UIColor blackColor];
    dimView.alpha = 0.4;
    [contanerView insertSubview:dimView atIndex:0];
    
    [dimView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.top.equalTo(contanerView);
    }];
    
    //5.添加tap
    [cancelBtn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
}
//销毁控制器
- (void)clickBtn {
    
    [self.presentedViewController dismissViewControllerAnimated:YES completion:nil];
}
@end
