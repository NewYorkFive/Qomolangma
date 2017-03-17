//
//  QLMMineHeaderView.m
//  Qomolangma
//
//  Created by Aioria on 2017/3/16.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMMineHeaderView.h"

@implementation QLMMineHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
    self.backgroundColor = [UIColor clearColor];
    
    UIView *bottomView = [[UIView alloc] init];
    bottomView.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:bottomView];
    
    UIButton *btnHeaderIcon = [[UIButton alloc] init];
    
    [btnHeaderIcon setBackgroundImage:[UIImage imageNamed:@"placeholderImage"] forState:UIControlStateNormal];
    
    btnHeaderIcon.layer.cornerRadius = 35;
    btnHeaderIcon.layer.masksToBounds = YES;
    
    btnHeaderIcon.layer.borderWidth = 3;
    btnHeaderIcon.layer.borderColor = [UIColor whiteColor].CGColor;
    
    [btnHeaderIcon addTarget:self action:@selector(btnHeaderIconAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:btnHeaderIcon];
    
    UIButton *btnNickName = [[UIButton alloc] init];
    
    [btnNickName setTitle:@"未登陆" forState:UIControlStateNormal];
    
    [btnNickName setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    btnNickName.titleLabel.font = [UIFont systemFontOfSize:15];
    
    [btnNickName addTarget:self action:@selector(btnHeaderIconAction:) forControlEvents:UIControlEventTouchUpInside];

    [btnNickName sizeToFit];
    
    [self addSubview:btnNickName];
    
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.offset(0);
        make.height.offset(60);
    }];
    
    [btnHeaderIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bottomView).offset(-35);
        make.centerX.offset(0);
        make.height.width.offset(70);
    }];
    
    [btnNickName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(btnHeaderIcon.mas_bottom).offset(-3);
        make.centerX.offset(0);
    }];

}

- (void)btnHeaderIconAction: (UIButton *)sender
{
//    QLMMineLoginSelectController *loginSelectController = [[QLMMineLoginSelectController alloc] init];
//    
//    UINavigationController *navC = [[UINavigationController alloc] initWithRootViewController:loginSelectController];
    
    if (self.modalBlock)
    {
        self.modalBlock();
    }

}


@end
