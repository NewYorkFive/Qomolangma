//
//  QLMspecialColumnTableViewCell.m
//  Qomolangma
//
//  Created by 张晨晖 on 2017/3/18.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMspecialColumnTableViewCell.h"
#import <UIImageView+WebCache.h>

@interface QLMspecialColumnTableViewCell ()

///最底部的线
@property (nonatomic, strong) UILabel *label;

///订阅多久多少钱的多久
@property (nonatomic, strong) UILabel *labelPrice_unit;

///多久之前更新的
@property (nonatomic, strong) UILabel *labelUpdate_time;

///讲述人简介
@property (nonatomic, strong) UILabel *labelPerson_info;

///讲述人名字
@property (nonatomic, strong) UILabel *labelAuthor;

///讲述人图片
@property (nonatomic, strong) UIImageView *image_url;

///订阅价格
@property (nonatomic, strong) UILabel *labelPrice;

///标题名字
@property (nonatomic, strong) UILabel *labelName;

///中间的文字介绍
@property (nonatomic, strong) UILabel *labelLast_title;

///底部的文字
@property (nonatomic, strong) UILabel *labelContent;

///"/"分隔符
@property (nonatomic, strong) UILabel *labelLine;

///"¥"符号
@property (nonatomic, strong) UILabel *labelRMB;

@end

@implementation QLMspecialColumnTableViewCell



- (void)setSpecialColumn:(QLMSpecialColumn *)specialColumn {
    
    _specialColumn = specialColumn;
    
    self.label.backgroundColor = [UIColor grayColor];
    self.label.alpha = .4;

    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.right.offset(0);
        make.height.offset(1);
        make.bottom.offset(0);
    }];
    
    [self.image_url mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(16);
        make.height.offset(120);
        make.width.offset(90);
        make.top.equalTo(self.contentView.mas_top).offset(16);
        //        make.bottom.offset(-8);
        // MARK:问题点
        make.bottom.lessThanOrEqualTo(@-8);
    }];
    //切边加毛边
    self.image_url.layer.cornerRadius = 8;
    self.image_url.layer.masksToBounds = YES;
    self.image_url.layer.borderColor = (__bridge CGColorRef _Nullable)([UIColor whiteColor]);
    self.image_url.layer.borderWidth = 2;
    
    self.labelName.text = @"标题";
    self.labelName.font = [UIFont systemFontOfSize:14];
    [self.labelName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.image_url.mas_right).offset(8);
        make.top.equalTo(self.image_url.mas_top);
        make.height.offset(14);
    }];
    
    self.labelLast_title.font = [UIFont systemFontOfSize:12];
    self.labelLast_title.textColor = [UIColor grayColor];
    self.labelLast_title.alpha = .8;
    self.labelLast_title.text = @"Null";
    [self.labelLast_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.labelName.mas_bottom).offset(12);
        make.left.equalTo(self.labelName.mas_left);
        make.right.equalTo(self.contentView.mas_right).offset(-16);
    }];
    
    self.labelPrice_unit.font = [UIFont systemFontOfSize:12];
    self.labelPrice_unit.textColor = [UIColor orangeColor];
    self.labelPrice_unit.alpha = .6;
    [self.labelPrice_unit mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-16);
        make.top.equalTo(self.contentView.mas_top).offset(16);
        make.height.width.offset(14);
    }];

    self.labelLine.text = @"/";
    self.labelLine.font = [UIFont systemFontOfSize:14];
    self.labelLine.textColor = [UIColor orangeColor];
    self.labelLine.alpha = .6;
    [self.labelLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.labelPrice_unit.mas_left);
        make.centerY.equalTo(self.labelPrice_unit.mas_centerY);
        make.height.offset(10);
    }];
    
    
    self.labelPrice.font = [UIFont systemFontOfSize:12];
    self.labelPrice.textColor = [UIColor orangeColor];
    self.labelPrice.alpha = .6;
    [self.labelPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.labelLine.mas_left);
        make.centerY.equalTo(self.labelLine.mas_centerY);
        make.height.offset(14);
    }];
    
    //钱币符号
    self.labelRMB.text = @"¥";
    self.labelRMB.font = [UIFont systemFontOfSize:12];
    self.labelRMB.textColor = [UIColor orangeColor];
    self.labelPrice.alpha = .6;
    [self.labelRMB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.labelPrice.mas_centerY);
        make.right.equalTo(self.labelPrice.mas_left);
    }];
    
    
    self.labelContent.font = [UIFont systemFontOfSize:12];
    self.labelContent.alpha = .8;
    [self.labelContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.labelLast_title.mas_left);
        make.top.equalTo(self.labelLast_title.mas_bottom).offset(32);
    }];
    
    
    //把数据放到控件上
    [self.image_url sd_setImageWithURL:[NSURL URLWithString:_specialColumn.image_url]];
    self.labelName.text = _specialColumn.name;
    self.labelLast_title.text = _specialColumn.last_title;
    self.labelPrice.text = _specialColumn.price;
    self.labelPrice_unit.text = _specialColumn.price_unit;
    self.labelContent.text = _specialColumn.content;
    
    self.labelUpdate_time.text = _specialColumn.update_time;
    self.labelPerson_info.text = _specialColumn.person_info;
    self.labelAuthor.text = _specialColumn.author;

    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
    self.image_url = [[UIImageView alloc] init];
    [self.contentView addSubview:self.image_url];
    
    self.labelName = [[UILabel alloc] init];
    [self.contentView addSubview:self.labelName];
    
    self.labelLast_title = [[UILabel alloc] init];
    [self.contentView addSubview:self.labelLast_title];
    
    self.labelPrice = [[UILabel alloc] init];
    [self.contentView addSubview:self.labelPrice];
    
    self.labelPrice_unit = [[UILabel alloc] init];
    [self.contentView addSubview:self.labelPrice_unit];
 
    self.labelContent = [[UILabel alloc] init];
    [self.contentView addSubview:self.labelContent];
    
    self.label = [[UILabel alloc] init];
    [self.contentView addSubview:self.label];
    
    self.labelLine = [[UILabel alloc] init];
    [self.contentView addSubview:self.labelLine];
    
    self.labelRMB = [[UILabel alloc] init];
    [self.contentView addSubview:self.labelRMB];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
