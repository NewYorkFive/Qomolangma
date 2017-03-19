//
//  QLMMineUserInfoBottomCell.m
//  Qomolangma
//
//  Created by Aioria on 2017/3/18.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMMineUserInfoBottomCell.h"

@interface QLMMineUserInfoBottomCell ()

@property (nonatomic, strong) UILabel *labInfo;

@end

@implementation QLMMineUserInfoBottomCell


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
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.labInfo = [UILabel fcs_labelWithColor:[UIColor blackColor] andFontSize:16 andText:@"222"];
    
    [self.contentView addSubview:self.labInfo];
    
    [self.labInfo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(12);
        make.centerY.offset(0);
        make.width.offset(80);
    }];
    
    self.txtDetail = [[UITextField alloc] init];
    
    self.txtDetail.textColor = [UIColor grayColor];
    
    self.txtDetail.font = [UIFont systemFontOfSize:14];
    
    [self.contentView addSubview:self.txtDetail];
    
    [self.txtDetail mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.labInfo.mas_right).offset(5);
        make.top.bottom.offset(0);
        make.right.offset(-12);
    }];
    
}

- (void)setDicDescription:(NSDictionary *)dicDescription
{
    _dicDescription = dicDescription;
    
    self.labInfo.text = dicDescription[@"name"];
    
    self.txtDetail.text = dicDescription[@"detail"];
}

@end
