//
//  QLMPurchasedCollectionViewCell.m
//  Qomolangma
//
//  Created by 王惠平 on 2017/3/17.
//  Copyright © 2017年 Focus. All rights reserved.
//


#import "QLMPurchasedCollectionViewCell.h"
#import "QLMPurchasedTwoViewController.h"


/**
 在每个Cell上添加ViewController (vc里是ControllerView)
 */
@implementation QLMPurchasedCollectionViewCell


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
    
    QLMPurchasedTwoViewController *vc = [[QLMPurchasedTwoViewController alloc]init];
    
    
    
    [self.contentView addSubview:vc.view];
    
    
}

@end
