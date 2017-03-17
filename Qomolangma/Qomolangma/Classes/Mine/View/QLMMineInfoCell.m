//
//  QLMMineInfoCell.m
//  Qomolangma
//
//  Created by Aioria on 2017/3/16.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMMineInfoCell.h"

@implementation QLMMineInfoCell

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
    self.detailTextLabel.font = [UIFont systemFontOfSize:12];
    self.textLabel.font = [UIFont systemFontOfSize:15];
//    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setMineInfoModel:(QLMMineInfoModel *)mineInfoModel
{
    _mineInfoModel = mineInfoModel;
    
    self.detailTextLabel.text = mineInfoModel.detail;
    
    self.imageView.image = [UIImage imageNamed:mineInfoModel.icon];
    
    self.textLabel.text = mineInfoModel.name;
    
    if (mineInfoModel.isOrange)
    {
        self.detailTextLabel.textColor = [UIColor orangeColor];
    }
    else
    {
        self.detailTextLabel.textColor = [UIColor lightGrayColor];
    }
}


@end
