//
//  QLMDayDayUpZiShiTableViewCellView.m
//  Qomolangma
//
//  Created by 张晨晖 on 2017/3/20.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMDayDayUpZiShiTableViewCellView.h"
#import <Masonry.h>

@implementation QLMDayDayUpZiShiTableViewCellView

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]){
        [self setupUI];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self setupUI];
}

- (void)setupUI {
    
    self.backgroundColor = [UIColor blackColor];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width / 2 - 1;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    //列表
    UIButton *button1 = [[UIButton alloc] init];
    [button1 setTitle:@"列表" forState:UIControlStateNormal];
    [button1 setImage:[UIImage imageNamed:@"mediaplayer_list_btn"] forState:UIControlStateNormal];
    [button1 setImage:[UIImage imageNamed:@"mediaplayer_list_btn"] forState:UIControlStateHighlighted];
    [self addSubview:button1];
    [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(width);
        make.height.offset(height);
        make.left.top.offset(0);
    }];
    
    
    //下载(打开编辑模式)
    UIButton *button2 = [[UIButton alloc] init];
    [button2 setTitle:@"下载" forState:UIControlStateNormal];
    [button2 setImage:[UIImage imageNamed:@"main_pop_already_download"] forState:UIControlStateNormal];
    [button2 setImage:[UIImage imageNamed:@"main_pop_already_download"] forState:UIControlStateHighlighted];
    [self addSubview:button2];
    [button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(width);
        make.height.offset(height);
        make.right.top.offset(0);
    }];
    
    //顶部的线
    UIView *line1 = [[UIView alloc] init];
    line1.backgroundColor = [UIColor grayColor];
    line1.alpha = .6;
    [self addSubview:line1];
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(1);
        make.left.right.top.offset(0);
    }];
    
    //底部的线
    UIView *line2 = [[UIView alloc] init];
    line2.backgroundColor = [UIColor grayColor];
    line2.alpha = .6;
    [self addSubview:line2];
    [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(1);
        make.left.right.bottom.offset(0);
    }];
    
    //中间的线
    UIView *line3 = [[UIView alloc] init];
    line3.backgroundColor = [UIColor grayColor];
    line3.alpha = .6;
    [self addSubview:line3];
    [line3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.offset(1);
        make.centerY.equalTo(self.mas_centerY);
        make.top.offset(8);
        make.bottom.offset(-8);
    }];
    
}

@end
