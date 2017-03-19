//
//  QLMMineSettingBottomCell.m
//  Qomolangma
//
//  Created by Aioria on 2017/3/19.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMMineSettingBottomCell.h"

@implementation QLMMineSettingBottomCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
    UILabel *labBack = [UILabel fcs_labelWithColor:[UIColor orangeColor] andFontSize:15 andText:@"退出"];
    [self.contentView addSubview:labBack];
    [labBack mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.offset(0);
    }];
}

@end
