//
//  QLMLearnTableViewCell.m
//  Qomolangma
//
//  Created by 刘康 on 2017/3/16.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMLearnTableViewCell.h"
#import <UIImageView+WebCache.h>

@interface QLMLearnTableViewCell ()
@property (nonatomic, strong) UIImageView *learnBookImageView;
@property (nonatomic, strong) UILabel *learnBookTitleLabel;
@property (nonatomic, strong) UILabel *learnBookreadersLabel;
@property (nonatomic, strong) UILabel *learnBookTextLabel;
@property (nonatomic, strong) UILabel *learnBookIntroduceLabel;
@property (nonatomic, strong) UILabel *learnBookPriceLabel;

@end

@implementation QLMLearnTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

//自定义tableCell,添加数据
- (void)setupUI {
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    //添加控件
    //image
    UIImageView *learnBookImageView = [[UIImageView alloc] init];
    self.learnBookImageView = learnBookImageView;
    learnBookImageView.image = [UIImage imageNamed:@"audio_subscribe_icon"];
    //title
    UILabel *learnBookTitleLabel = [[UILabel alloc] init];
    learnBookTitleLabel.text = @"读古希腊神话学营销";
    self.learnBookTitleLabel = learnBookTitleLabel;
    //reader
    UILabel *learnBookreadersLabel = [[UILabel alloc] init];
    learnBookreadersLabel.text = @"1人订阅";
    learnBookreadersLabel.font = [UIFont systemFontOfSize:12];
    learnBookreadersLabel.textColor = [UIColor lightGrayColor];
    self.learnBookreadersLabel = learnBookreadersLabel;
    //text
    UILabel *learnBookTextLabel = [[UILabel alloc] init];
    learnBookTextLabel.text = @"杨烁今日称小乐老师2010年中国年度十大杨烁今日称小乐老师2010年中国年度十大";
    learnBookTextLabel.font = [UIFont systemFontOfSize:12];
    learnBookTextLabel.textColor = [UIColor grayColor];
    self.learnBookTextLabel = learnBookTextLabel;
    //introduce
    UILabel *learnBookIntroduceLabel = [[UILabel alloc] init];
    learnBookIntroduceLabel.text = @"从古希腊神话中系统地学习营销之道";
    learnBookIntroduceLabel.font = [UIFont systemFontOfSize:12];
    learnBookIntroduceLabel.textColor = [UIColor lightGrayColor];
    self.learnBookIntroduceLabel = learnBookIntroduceLabel;
    //price
    UILabel *learnBookPriceLabel = [[UILabel alloc] init];
    learnBookPriceLabel.text = @"¥39/月";
    learnBookPriceLabel.font = [UIFont systemFontOfSize:12];
    learnBookPriceLabel.textColor = [UIColor brownColor];
    self.learnBookPriceLabel = learnBookPriceLabel;
    
    //add
    [self.contentView addSubview:learnBookImageView];
    [self.contentView addSubview:learnBookTitleLabel];
    [self.contentView addSubview:learnBookreadersLabel];
    [self.contentView addSubview:learnBookTextLabel];
    [self.contentView addSubview:learnBookIntroduceLabel];
    [self.contentView addSubview:learnBookPriceLabel];
   //layout
    [learnBookImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.offset(10);
        make.bottom.offset(-10);
        make.width.offset(60);
    }];
    [learnBookTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(10);
        make.left.equalTo(learnBookImageView.mas_right).offset(5);
    }];
    [learnBookreadersLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(10);
        make.right.equalTo(self).offset(-10);
    }];
    [learnBookTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(learnBookTitleLabel);
        make.top.equalTo(learnBookTitleLabel.mas_bottom).offset(5);
        make.right.equalTo(self).offset(-40);
    }];
    [learnBookIntroduceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(learnBookTitleLabel);
        make.top.equalTo(learnBookTextLabel.mas_bottom).offset(5);
        make.right.equalTo(self).offset(-40);
    }];
    [learnBookPriceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(learnBookImageView);
        make.left.equalTo(learnBookTitleLabel);
    }];
    
}

//模型数据添加到控件
- (void)setModel:(QLMLearnFirstCellModel *)model{
    _model = model;
    [self.learnBookImageView sd_setImageWithURL:[NSURL URLWithString:model.image_url]];
    
    self.learnBookTitleLabel.text = model.name;
    self.learnBookreadersLabel.text = [NSString stringWithFormat:@"%zd人订阅",model.subscribe_count];
    self.learnBookTextLabel.text = model.person_info;
    self.learnBookIntroduceLabel.text = model.content;
    self.learnBookPriceLabel.text = [NSString stringWithFormat:@"¥%zd/%@",model.price,model.price_unit];
    
}









@end
