//
//  QLMMineTopCell.m
//  Qomolangma
//
//  Created by Aioria on 2017/3/16.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMMineTopCell.h"

@implementation QLMMineTopCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:reuseIdentifier])
    {
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    self.backgroundColor = [UIColor whiteColor];
    
    NSArray *infoTitlesArray = @[@"学习时间", @"阅读书籍", @"连续学习"];
    NSArray *detailTitlesArray = @[@"_", @"_", @"_"];
    
    NSMutableArray *infoViewsArray = [NSMutableArray array];
    
    
    for (NSInteger i = 0; i < infoTitlesArray.count; i++)
    {
        UIView *infoView = [self setInfoViewWithInfoTitle:infoTitlesArray[i] andDetailTitle:detailTitlesArray[i]];
        
        [self.contentView addSubview:infoView];
        
        [infoViewsArray addObject:infoView];
        
    }
    
    [infoViewsArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    
    [infoViewsArray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
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
