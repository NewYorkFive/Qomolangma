//
//  QLMTestReadTableViewCell.m
//  Qomolangma
//
//  Created by 刘康 on 2017/3/18.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMTestReadTableViewCell.h"

@interface QLMTestReadTableViewCell ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *priceTimesLabel;
@property (nonatomic, strong) UILabel *readCountLabel;
@property (nonatomic, strong) UIButton *priceBtn;
@end

@implementation QLMTestReadTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    
    //添加控件
    UILabel *titleLabel = [UILabel fcs_labelWithColor:[UIColor blackColor] andFontSize:16 andText:@"3.01 读古希腊神话学营销 | 客户的心思猜不透? 反其道而行之才是制胜法宝!"];
    self.titleLabel = titleLabel;
    titleLabel.numberOfLines = 0;
    UILabel *timeLabel = [UILabel fcs_labelWithColor:[UIColor lightGrayColor] andFontSize:10 andText:@"03月15日"];
    UILabel *readCountLabel = [UILabel fcs_labelWithColor:[UIColor lightGrayColor] andFontSize:10 andText:@"1人读过"];
    self.readCountLabel = readCountLabel;
    UILabel *priceTimesLabel = [UILabel fcs_labelWithColor:[UIColor grayColor] andFontSize:14 andText:@"0"];
    self.priceTimesLabel = priceTimesLabel;
    UILabel *tipLabel = [UILabel fcs_labelWithColor:[UIColor grayColor] andFontSize:12 andText:@"别人还在养跟快的马的时候,福特已经开始造车了"];
    UILabel *readMoreLabel = [UILabel fcs_labelWithColor:[UIColor lightGrayColor] andFontSize:12 andText:@"阅读全文"];
    UIButton *priceBtn = [UIButton new];
    [priceBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [priceBtn setImage:[UIImage imageNamed:@"icon_007"] forState:UIControlStateNormal];
    UIButton *testReadBtn = [UIButton new];
    [testReadBtn setImage:[UIImage imageNamed:@"test_read"] forState:UIControlStateNormal];
    UIImageView *pointImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"2004"]];
    UIImageView *bigImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"userinfo_top_bg"]];
    self.model = self.model;
    [self.contentView addSubview:titleLabel];
    [self.contentView addSubview:readCountLabel];
    [self.contentView addSubview:timeLabel];
    [self.contentView addSubview:priceTimesLabel];
    [self.contentView addSubview:tipLabel];
    [self.contentView addSubview:readMoreLabel];
    [self.contentView addSubview:priceBtn];
    [self.contentView addSubview:testReadBtn];
    [self.contentView addSubview:pointImgView];
    [self.contentView addSubview:bigImgView];
    
    [pointImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self.contentView).offset(17);
        make.width.height.offset(7);
    }];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(10);
        make.left.equalTo(pointImgView.mas_right).offset(5);
        make.right.equalTo(self.contentView).offset(-20);
    }];
    [testReadBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView).offset(10);
            make.top.equalTo(titleLabel.mas_bottom).offset(5);
            make.width.offset(20);
            make.height.offset(15);
        }];
    [timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel.mas_bottom).offset(7);
        make.left.equalTo(testReadBtn.mas_right).offset(10);
    }];
    [readCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel.mas_bottom).offset(7);
        make.left.equalTo(timeLabel.mas_right).offset(15);
    }];
    [priceTimesLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(readCountLabel);
        make.right.equalTo(self.contentView).offset(-10);
    }];
    [priceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(priceTimesLabel);
        make.right.equalTo(priceTimesLabel.mas_left).offset(-3);
        make.height.offset(15);
        make.width.offset(15);
    }];
    [bigImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.top.equalTo(priceBtn.mas_bottom).offset(10);
        make.right.equalTo(self.contentView).offset(-10);
        make.height.offset(200);
    }];
    [tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bigImgView);
        make.top.equalTo(bigImgView.mas_bottom).offset(5);
    }];
    [readMoreLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-10);
        make.bottom.equalTo(self.contentView).offset(-10);
        make.top.equalTo(bigImgView.mas_bottom).offset(40);
    }];

}
- (void)clickBtn:(UIButton *)sender {
//    self.tag = 1;
    self.priceTimesLabel.text = [NSString stringWithFormat:@"%zd",1];
    
}

- (void)setModel:(QLMLearnFirstCellModel *)model {
    _model = model;
    
    self.titleLabel.text = [NSString stringWithFormat:@"3.01 %@ | %@ | %@",model.name,model.author,model.person_info];
    self.readCountLabel.text = [NSString stringWithFormat:@"%zd人已读",model.subscribe_count];
}
@end
