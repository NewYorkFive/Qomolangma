//
//  QLMspecialColumnView.m
//  Qomolangma
//
//  Created by 张晨晖 on 2017/3/19.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMspecialColumnView.h"

@interface QLMspecialColumnView ()

///顶部行业达人标记
@property (nonatomic, strong) UILabel *labelTitle;

///最顶上的参考线
@property (nonatomic, strong) UILabel *label;

//换一换按钮
@property (nonatomic, strong) UIButton *changeButton;

//换一换图片
@property (nonatomic, strong) UIImageView *changeImageView;

@end

@implementation QLMspecialColumnView

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
    
    self.backgroundColor = [UIColor whiteColor];
    self.userInteractionEnabled = YES;
    //行业达人
    self.labelTitle = [[UILabel alloc] init];
    [self addSubview:self.labelTitle];
    self.label = [[UILabel alloc] init];
    [self addSubview:self.label];
    //顶部"查看听书日历"按钮

    self.changeButton = [[UIButton alloc] init];
    [self addSubview:self.changeButton];
    //小箭头
    self.changeImageView = [[UIImageView alloc] init];
    [self addSubview:self.changeImageView];
    
    _labelTitle.text = @"行业达人";
    _labelTitle.font = [UIFont systemFontOfSize:15];
    [_labelTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(8);
        make.top.offset(16);
    }];

    //线
    self.label.backgroundColor = [UIColor grayColor];
    self.label.alpha = .4;
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(16);
        make.right.offset(-16);
        make.height.offset(1);
        make.top.equalTo(_labelTitle.mas_bottom).offset(16);
        make.bottom.equalTo(self.mas_bottom).offset(0);
    }];

    //换一换button
    [self.changeButton setTitle:@"换一换" forState:UIControlStateNormal];
    self.changeButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.changeButton setTitleColor:[UIColor colorWithRed:175.0/255.0 green:159.0/255.0 blue:142.0/255.0 alpha:1] forState:UIControlStateNormal];
    [self.changeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.labelTitle.mas_centerY);
        make.right.offset(-16);
    }];
    //MARK:换一换点击事件
    [self.changeButton addTarget:_delegate action:@selector(specialColumnViewReloadData) forControlEvents:UIControlEventTouchUpInside];
//    [self.changeButton addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];

    self.changeImageView.image = [UIImage imageNamed:@"home_icon_exchange"];
    [self.changeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.changeButton.mas_centerY);
        make.right.equalTo(self.changeButton.mas_left);
    }];
    
}

@end
