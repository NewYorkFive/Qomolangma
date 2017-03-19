//
//  QLMMineStudyRecordHeaderView.m
//  Qomolangma
//
//  Created by Aioria on 2017/3/17.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMMineStudyRecordHeaderView.h"

@interface QLMMineStudyRecordHeaderView ()

@property (nonatomic, weak)UIButton *btnNickName;

@end

@implementation QLMMineStudyRecordHeaderView

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
    self.backgroundColor = [UIColor whiteColor];
    
    UIButton *btnHeaderIcon = [[UIButton alloc] init];
    
    [btnHeaderIcon setBackgroundImage:[UIImage imageNamed:@"headIcon"] forState:UIControlStateNormal];
    
    btnHeaderIcon.layer.cornerRadius = 35;
    btnHeaderIcon.layer.masksToBounds = YES;
    
    btnHeaderIcon.layer.borderWidth = 3;
    btnHeaderIcon.layer.borderColor = [UIColor whiteColor].CGColor;
    
    btnHeaderIcon.userInteractionEnabled = NO;
    
    [self addSubview:btnHeaderIcon];
    
    UIButton *btnNickName = [[UIButton alloc] init];
    
    NSString *nickName = [[NSUserDefaults standardUserDefaults] valueForKey:kNicName];
    
    [btnNickName setTitle:nickName forState:UIControlStateNormal];
    
    [btnNickName setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    btnNickName.titleLabel.font = [UIFont systemFontOfSize:15];
    
    btnNickName.userInteractionEnabled = NO;
    
    [btnNickName sizeToFit];
    
    [self addSubview:btnNickName];
    
    self.btnNickName = btnNickName;
    
    [btnHeaderIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(20);
        make.centerX.offset(0);
        make.height.width.offset(70);
    }];
    
    [btnNickName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(btnHeaderIcon.mas_bottom).offset(-3);
        make.centerX.offset(0);
    }];
    
    
    NSArray *infoTitlesArray = @[@"学习时间", @"阅读书籍", @"连续学习"];
    NSArray *detailTitlesArray = @[@"0", @"0", @"0"];
    
    NSMutableArray *infoViewsArray = [NSMutableArray array];
    
    
    for (NSInteger i = 0; i < infoTitlesArray.count; i++)
    {
        UIView *infoView = [self setInfoViewWithInfoTitle:infoTitlesArray[i] andDetailTitle:detailTitlesArray[i]];
        
        [self addSubview:infoView];
        
        [infoViewsArray addObject:infoView];
        
    }
    
    [infoViewsArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    
    [infoViewsArray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(btnNickName.mas_bottom).offset(0);
    }];
}

- (UIView *)setInfoViewWithInfoTitle: (NSString *)infoTitle andDetailTitle: (NSString *)detailtitle
{
    UIView *infoView = [[UIView alloc] init];
    
    UILabel *labDetail = [UILabel fcs_labelWithColor:[UIColor blackColor] andFontSize:14 andText:detailtitle];
    
    [infoView addSubview:labDetail];
    
    UILabel *labInfo = [UILabel fcs_labelWithColor:[UIColor lightGrayColor] andFontSize:12 andText:infoTitle];
    
    [infoView addSubview:labInfo];
    
    [labDetail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(infoView);
        make.top.offset(0);
    }];
    
    [labInfo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(infoView);
        make.top.equalTo(labDetail.mas_bottom).offset(5);
    }];
    
    return infoView;
    
}




@end
