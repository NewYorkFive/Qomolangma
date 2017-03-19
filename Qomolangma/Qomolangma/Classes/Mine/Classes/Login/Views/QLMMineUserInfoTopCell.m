//
//  QLMMineUserInfoTopCell.m
//  Qomolangma
//
//  Created by Aioria on 2017/3/18.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMMineUserInfoTopCell.h"

@interface QLMMineUserInfoTopCell ()

@property (nonatomic, strong)UIImageView *imgIcon;

@end

@implementation QLMMineUserInfoTopCell

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
    self.imgIcon = [[UIImageView alloc] init];
    
    self.imgIcon.contentMode = UIViewContentModeScaleAspectFill;
    
    self.imgIcon.image = [UIImage imageNamed:@"headIcon"];
    
    self.imgIcon.layer.cornerRadius = 40;
    self.imgIcon.layer.masksToBounds = YES;
    
    [self.contentView addSubview:self.imgIcon];
    
    [self.imgIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(25);
        make.centerX.offset(0);
        make.height.width.offset(80);
    }];
    
    UIImageView *imgCamera = [[UIImageView alloc] init];

    imgCamera.image = [UIImage imageNamed:@"change_userinfo_camear_icon_25x25_"];
    
    [self.contentView addSubview:imgCamera];
    
    [imgCamera mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.equalTo(self.imgIcon);
        make.width.height.offset(20);
    }];
    
    UILabel *labDescription = [UILabel fcs_labelWithColor:[UIColor lightGrayColor] andFontSize:12 andText:@"头像会用作公开资料"];
    
    [self.contentView addSubview:labDescription];
    
    [labDescription mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imgIcon.mas_bottom).offset(20);
        make.centerX.offset(0);
    }];
}

- (void)setIconName:(NSString *)iconName
{
    _iconName = iconName;
    
    self.imgIcon.image = [UIImage imageNamed:iconName];
    
    
}

@end
