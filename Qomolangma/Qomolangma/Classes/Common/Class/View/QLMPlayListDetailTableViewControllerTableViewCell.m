//
//  QLMPlayListDetailTableViewControllerTableViewCell.m
//  Qomolangma
//
//  Created by NowOrNever on 18/03/2017.
//  Copyright © 2017 Focus. All rights reserved.
//

#import "QLMPlayListDetailTableViewControllerTableViewCell.h"

@interface QLMPlayListDetailTableViewControllerTableViewCell ()
@property (nonatomic, strong) UIImageView *modelIconImageView;
@property (nonatomic, strong) UILabel *modelTitle;
@property (nonatomic, strong) UIImageView *modelDownloadImageView;
@property (nonatomic, strong) UILabel *modelTimeLengthLabel;
@property (nonatomic, strong) UILabel *modelDescriptionLabel;
@property (nonatomic, strong) UILabel *modelProgressLabel;

@end

@implementation QLMPlayListDetailTableViewControllerTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupUI];
}

- (void)setupUI{
    [self.contentView addSubview:self.modelIconImageView];
    [self.contentView addSubview:self.modelDownloadImageView];
    [self.contentView addSubview:self.modelTitle];
    [self.contentView addSubview:self.modelDescriptionLabel];
    [self.contentView addSubview:self.modelTimeLengthLabel];
    [self.contentView addSubview:self.modelProgressLabel];
    
    CGFloat margin = 10.0;
    
    [self.contentView layoutIfNeeded];
    
    [self.modelIconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(60);
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(margin * 1.5);
    }];
    
    
    [self.modelTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.modelIconImageView.mas_right).offset(margin);
        //        make.centerY.mas_equalTo(self.modelDownloadImageView.bounds.size.height * 0.3);
        make.top.equalTo(self.modelIconImageView).offset(6);
        make.right.equalTo(self.contentView).offset(-margin);
    }];
    
    [self.modelDownloadImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.mas_equalTo(15);
        make.bottom.equalTo(self.modelIconImageView).offset(-6);
        make.left.equalTo(self.modelIconImageView.mas_right).offset(margin);
    }];
    
    
    
    [self.modelTimeLengthLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.modelDownloadImageView.mas_right).offset(margin);
        make.centerY.equalTo(self.modelDownloadImageView);
    }];
    
    [self.modelDescriptionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.modelTimeLengthLabel.mas_right).offset(margin);
        make.centerY.equalTo(self.modelDownloadImageView);
        make.width.lessThanOrEqualTo(@(self.contentView.bounds.size.width * 0.4));
    }];
    
    [self.modelProgressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.modelDescriptionLabel.mas_right).offset(margin);
        make.centerY.equalTo(self.modelDownloadImageView);
    }];
    
}




//@property (nonatomic, strong) UIImageView *modelImageView;
//@property (nonatomic, strong) UILabel *modelTitle;
//@property (nonatomic, strong) UILabel *modelDiscription;
//@property (nonatomic, strong) UIImageView *modelDownloadImageView;
- (UIImageView *)modelIconImageView{
    if (!_modelIconImageView) {
        _modelIconImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"audio_today_icon_lock"]];
    }
    return _modelIconImageView;
}

- (UILabel *)modelTitle{
    if (!_modelTitle) {
        _modelTitle = [UILabel fcs_labelWithColor:[UIColor colorWithWhite:.4 alpha:1] andFontSize:20 andText:@"ModelTitle:This is a test,please ignore"];
    }
    return _modelTitle;
}

- (UILabel *)modelDescriptionLabel{
    if (!_modelDescriptionLabel) {
        _modelDescriptionLabel = [UILabel fcs_labelWithColor:[UIColor colorWithWhite:.5 alpha:1] andFontSize:14 andText:@"科技 商业"];
    }
    return _modelDescriptionLabel;
}

- (UIImageView *)modelDownloadImageView{
    if (!_modelDownloadImageView) {
        _modelDownloadImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"feed_timeline_read_12x12_"]];
    }
    return _modelDownloadImageView;
}

- (UILabel *)modelTimeLengthLabel{
    if (!_modelTimeLengthLabel) {
        _modelTimeLengthLabel = [UILabel fcs_labelWithColor:[UIColor colorWithWhite:.5 alpha:1] andFontSize:14 andText:[NSString stringWithFormat:@"%zd:%zd",arc4random_uniform(10),arc4random_uniform(60)]];
    }
    return _modelTimeLengthLabel;
}

- (UILabel *)modelProgressLabel{
    if (!_modelProgressLabel) {
        _modelProgressLabel = [UILabel fcs_labelWithColor: [UIColor orangeColor] andFontSize:14 andText:[NSString stringWithFormat:@"已播%zd%%",arc4random_uniform(100)]];
    }
    return _modelProgressLabel;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

//@property (nonatomic, strong) UIImageView *modelIconImageView;
//@property (nonatomic, strong) UILabel *modelTitle;
//@property (nonatomic, strong) UIImageView *modelDownloadImageView;
//@property (nonatomic, strong) UILabel *modelTimeLengthLabel;
//@property (nonatomic, strong) UILabel *modelDescriptionLabel;
//@property (nonatomic, strong) UILabel *modelProgressLabel;

- (void)setModel:(QLMAudioModel *)model{
    _model = model;
    self.modelTitle.text = model.resource_name;
    self.modelDescriptionLabel.text = model.resource_content;
}




@end
