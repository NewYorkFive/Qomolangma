//
//  QLMEverydayBookTableViewCell.m
//  Qomolangma
//
//  Created by 张晨晖 on 2017/3/16.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMEverydayBookTableViewCell.h"
#import <Masonry.h>
#import <UIImageView+WebCache.h>

@interface QLMEverydayBookTableViewCell ()

//人物小图片
@property (nonatomic, strong) UIImageView *imageViewReader_header_url;

//讲述人
@property (nonatomic, strong) UILabel *labelReader_name;

//cell标题
@property (nonatomic, strong) UILabel *labelResource_content;

//讲述人图片URL地址
@property (nonatomic, strong) UIImageView *image_url;

//图片右边的文字介绍
@property (nonatomic, strong) UILabel *labelReader_introduce;

//价格
@property (nonatomic, strong) UILabel *labelPrice;

////
//@property (nonatomic, strong) NSString *resource_name;

///购买按钮
@property (nonatomic, strong) UIButton *buyButton;

@end

@implementation QLMEverydayBookTableViewCell

- (void)setEverydayBook:(QLMEverydayBook *)everydayBook {
    
    _everydayBook = everydayBook;
    
    //把数据放在控件上
    self.labelResource_content.text = everydayBook.resource_content;
    self.labelReader_introduce.text = everydayBook.reader_introduce;
    [self.image_url sd_setImageWithURL:[NSURL URLWithString:everydayBook.image_url]];
    self.labelReader_name.text = everydayBook.reader_name;
    self.labelPrice.text = everydayBook.price;
    [self.imageViewReader_header_url sd_setImageWithURL:[NSURL URLWithString:everydayBook.reader_header_url]];
    
    self.imageViewReader_header_url.layer.cornerRadius = self.imageViewReader_header_url.bounds.size.width * .5;
    self.imageViewReader_header_url.layer.masksToBounds = YES;
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:@"QLMEverydayBookTableViewCell"]) {
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
    
    //cell标题
    self.labelResource_content = [[UILabel alloc] init];
    //图片右边的文字介绍
    self.labelReader_introduce = [[UILabel alloc] init];
    //讲述人图片
    self.image_url = [[UIImageView alloc] init];
    //讲述人
    self.labelReader_name = [[UILabel alloc] init];
    //价格
    self.labelPrice = [[UILabel alloc] init];
    //人物小图片
    self.imageViewReader_header_url = [[UIImageView alloc] init];
 
    UILabel *label1 = [[UILabel alloc] init];
    [self.contentView addSubview:label1];
    label1.text = @"今今乐道";
    label1.font = [UIFont systemFontOfSize:16];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.offset(16);
    }];
    //小箭头
    
    
    //顶部"查看听书日历"
    UILabel *label2 = [[UILabel alloc] init];
    [self.contentView addSubview:label2];
    label2.text = @"查看听书日历";
    label2.font = [UIFont systemFontOfSize:11];
    label2.textColor = [UIColor grayColor];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(16);
        make.right.offset(-8);
    }];
    
    UILabel *line1 = [[UILabel alloc] init];
    [self.contentView addSubview:line1];
    line1.alpha = .2;
    line1.backgroundColor = [UIColor grayColor];
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label1.mas_bottom).offset(4);
        make.left.offset(16);
        make.right.offset(-16);
        make.height.offset(1);
    }];
    
    //    //将图片添加到cell  //小图片
    self.imageViewReader_header_url.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:self.imageViewReader_header_url];
    [self.imageViewReader_header_url mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line1.mas_bottom).offset(4);
        make.left.equalTo(line1.mas_left).offset(8);
        make.height.width.offset(30);
//        make.bottom.equalTo(self.contentView.mas_bottom).offset(-8);
    }];
    self.imageViewReader_header_url.layer.cornerRadius = self.imageViewReader_header_url.bounds.size.width * .5;
    self.imageViewReader_header_url.layer.masksToBounds = YES;
    
    //姓名
    [self.contentView addSubview:_labelReader_name];
    self.labelReader_name.font = [UIFont systemFontOfSize:10];
    [self.labelReader_name  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_imageViewReader_header_url.mas_centerY);
        make.left.equalTo(_imageViewReader_header_url.mas_right).offset(8);
        make.width.offset(35);
        make.height.offset(20);
    }];
    
    //标题
    [self.contentView addSubview:_labelResource_content];
    self.labelResource_content.font = [UIFont systemFontOfSize:10];
    [self.labelResource_content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_imageViewReader_header_url.mas_centerY);
        make.left.equalTo(_labelReader_name.mas_right).offset(8);
        make.right.offset(-16);
        make.height.offset(20);
    }];
    
    //中间的线
    UILabel *line2 = [[UILabel alloc] init];
    line2.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:line2];
    line2.alpha = .2;
    [line2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imageViewReader_header_url.mas_bottom).offset(4);
        make.height.offset(1);
        make.left.equalTo(self.imageViewReader_header_url.mas_left);
        make.right.equalTo(line1.mas_right).offset(-8);
    }];
    
    //大图
    [self.contentView addSubview:self.image_url];
    [self.image_url mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(140);
        make.width.offset(100);
        make.top.equalTo(line2.mas_bottom).offset(4);
        make.left.equalTo(line2.mas_left);
    }];
    
    //底部的线
    UILabel *line3 = [[UILabel alloc] init];
    [self.contentView addSubview:line3];
    line3.backgroundColor = [UIColor grayColor];
    line3.alpha = .2;
    [line3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_image_url.mas_bottom).offset(8);
        make.left.equalTo(line1.mas_left);
        make.right.equalTo(line1.mas_right);
        make.height.offset(1);
        make.bottom.offset(-4);
    }];

    //左边的线
    UILabel *line4 = [[UILabel alloc] init];
    [self.contentView addSubview:line4];
    line4.backgroundColor = [UIColor grayColor];
    line4.alpha = .2;
    [line4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(line1.mas_left);
        make.top.equalTo(line1.mas_bottom);
        make.width.offset(1);
        make.bottom.equalTo(line3.mas_top);
    }];
    
    //右边的竖线
    UILabel *line5 = [[UILabel alloc] init];
    [self.contentView addSubview:line5];
    line5.backgroundColor = [UIColor grayColor];
    line5.alpha = .2;
    [line5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(line1.mas_right);
        make.top.equalTo(line1.mas_bottom);
        make.width.offset(1);
        make.bottom.equalTo(line3.mas_top);
    }];
    
    //详细介绍
    [self.contentView addSubview:_labelReader_introduce];
    self.labelReader_introduce.font = [UIFont systemFontOfSize:12.0];
    //自适应内容
    self.labelReader_introduce.numberOfLines = 0;
    self.labelReader_introduce.textColor = [UIColor grayColor];
    [self.labelReader_introduce mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_image_url.mas_top).offset(4);
        make.left.equalTo(_image_url.mas_right).offset(4);
        make.right.equalTo(line5.mas_left).offset(-4);
        make.height.offset(50);
    }];
    
    //价格
    [self.contentView addSubview:self.labelPrice];
    self.labelPrice.textColor = [UIColor orangeColor];
    self.labelPrice.font = [UIFont systemFontOfSize:12];
    [self.labelPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_image_url.mas_right).offset(8);
        make.bottom.equalTo(_image_url.mas_bottom).offset(-4);
        make.width.offset(60);
        make.height.offset(20);
    }];
    
    //购买按钮
    self.buyButton = [[UIButton alloc] init];
    [self.contentView addSubview:self.buyButton];
    [self.buyButton setTitle:@"购买" forState:UIControlStateNormal];
    [self.buyButton setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
//    [self.buyButton setTitle:@"购买" forState:UIControlEventTouchUpInside];
//    [self.buyButton setTitleColor:[UIColor orangeColor] forState:UIControlEventTouchUpInside];
    
    [_buyButton sizeToFit];
    [self.buyButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(line5.mas_left).offset(-8);
        make.bottom.equalTo(line3.mas_top).offset(-8);
    }];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
