//
//  QLMRankingDataTableViewCell.m
//  Qomolangma
//
//  Created by 张晨晖 on 2017/3/17.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMRankingDataTableViewCell.h"
#import <Masonry.h>

@interface QLMRankingDataTableViewCell ()

@property (nonatomic ,strong) UIView *view;

@end

@implementation QLMRankingDataTableViewCell

- (void)setRankingDataArray:(NSArray<QLMRankingData *> *)rankingDataArray {
    
    _rankingDataArray = rankingDataArray;
    
    //把数据放在控件上
    
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
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
    
    //初始化三个button的View
    self.view = [[UIView alloc] init];
    
    UILabel *label1 = [[UILabel alloc] init];
    [self.contentView addSubview:label1];
    label1.text = @"热门排行榜";
    label1.font = [UIFont systemFontOfSize:14];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.offset(16);
    }];
    //小箭头
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"common_icon_arrow"];
    [self.contentView addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(label1.mas_centerY);
        make.right.offset(-8);
    }];
    
    //顶部"查看全部"
    UILabel *label2 = [[UILabel alloc] init];
    [self.contentView addSubview:label2];
    label2.text = @"查看全部";
    label2.font = [UIFont systemFontOfSize:12];
    label2.textColor = [UIColor grayColor];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(imageView.mas_centerY);
        make.right.equalTo(imageView.mas_left);
    }];

    [self.contentView addSubview:self.view];
    self.view.backgroundColor = [UIColor grayColor];
    [self.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(16);
        make.right.offset(-16);
        make.top.equalTo(label1.mas_bottom).offset(16);
        make.height.offset(180);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-8);
    }];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
