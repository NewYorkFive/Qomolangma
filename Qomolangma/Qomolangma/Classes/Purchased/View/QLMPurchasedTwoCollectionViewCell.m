//
//  QLMPurchasedTwoCollectionViewCell.m
//  Qomolangma
//
//  Created by 王惠平 on 2017/3/20.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMPurchasedTwoCollectionViewCell.h"

@implementation QLMPurchasedTwoCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self setupUI];
    }
    return self;
}

- (void)awakeFromNib {
    
    [super awakeFromNib];
    [self setupUI];
    
}

- (void)setupUI{
    
    self.contentView.backgroundColor = [UIColor whiteColor];

        UIButton *button = [[UIButton alloc]init];

        [button setImage:[UIImage imageNamed:@"purchased_empty_placeholder"] forState: UIControlStateNormal];

        [self.contentView addSubview:button];

        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView.mas_centerX);
            make.top.equalTo(self.contentView).offset(100 + kNavBarHeight);;
        }];

        UILabel *label = [[UILabel alloc]init];
    
        label.text = @"亲! 还没有已购商品哦! 😊";

        [self.contentView addSubview:label];

        [label mas_makeConstraints:^(MASConstraintMaker *make) {

            make.centerX.equalTo(self.contentView.mas_centerX);
            make.top.equalTo(button.mas_bottom).offset(20);
        }];

}

@end
