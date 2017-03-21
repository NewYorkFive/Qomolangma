//
//  QLMRankingDataTableViewCell.m
//  Qomolangma
//
//  Created by 张晨晖 on 2017/3/17.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMRankingDataTableViewCell.h"
#import "QLMHomeRankingButton.h"

@interface QLMRankingDataTableViewCell ()

//@property (nonatomic ,strong) UIView *view;
@property (nonatomic ,strong) NSArray <QLMHomeRankingButton *> *buttonArray;

@property (nonatomic ,strong) NSArray <UILabel *> *labelArray;

@end

@implementation QLMRankingDataTableViewCell

- (void)setRankingDataArray:(NSArray<QLMRankingData *> *)rankingDataArray {
    
    _rankingDataArray = rankingDataArray;
    
    //把数据放在控件上
    for (int i = 0; i < self.buttonArray.count; i++) {
        self.buttonArray[i].rankingData = self.rankingDataArray[i];
    }
    
    for (int i = 0; i < self.labelArray.count; i++) {
//        self.labelArray[i]
        self.labelArray[i].text = self.rankingDataArray[i].resource_name;
    }
    
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
//    self.view = [[UIView alloc] init];
    
    UILabel *label1 = [[UILabel alloc] init];
    [self.contentView addSubview:label1];
    label1.text = @"热门排行榜";
    label1.font = [UIFont systemFontOfSize:16];
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
    
    NSMutableArray<UIButton *> *buttonsArray = [NSMutableArray array];
    
    
    
    for (NSInteger i = 0; i < 3; i++)
    {
        QLMHomeRankingButton *button = [[QLMHomeRankingButton alloc] init];
        
        button.layer.cornerRadius = 8;
        button.layer.masksToBounds = YES;
        
        button.backgroundColor = [UIColor fcs_randomColor];
        
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.contentView addSubview:button];
        
        [buttonsArray addObject:button];
    }
    
    [buttonsArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:20 leadSpacing:15 tailSpacing:15];
    CGFloat height = ([UIScreen mainScreen].bounds.size.width - 20 * 2 + 15 + 15) / 3 * 5 / 4;
    [buttonsArray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label1.mas_bottom).offset(10);
//        make.height.offset(150);
        make.height.offset(height);
    }];
    
    self.buttonArray = buttonsArray.copy;
    
    NSMutableArray *labsArray = [NSMutableArray array];
    
    for (NSInteger i = 0; i < 3; i++)
    {
        UILabel *lab = [UILabel fcs_labelWithColor:[UIColor grayColor] andFontSize:11 andText:@"1111111111111222222222222222222222222211111"];
        lab.numberOfLines = 2;

        
        [self.contentView addSubview:lab];
        
        [labsArray addObject:lab];
    }
    
    self.labelArray = labsArray.copy;
    
    [labsArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:20 leadSpacing:15 tailSpacing:15];
    
    [labsArray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(buttonsArray[0].mas_bottom).offset(5);
        make.bottom.offset(-5);
    }];
    
}

- (void) buttonAction: (UIButton *)sender
{
    NSLog(@"1111");
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
