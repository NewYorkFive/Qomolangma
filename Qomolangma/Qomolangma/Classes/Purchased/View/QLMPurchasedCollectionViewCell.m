//
//  QLMPurchasedCollectionViewCell.m
//  Qomolangma
//
//  Created by 王惠平 on 2017/3/17.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMPurchasedCollectionViewCell.h"
#import "QLMPurchasedContentController.h"

@implementation QLMPurchasedCollectionViewCell {
    
    QLMPurchasedContentController *_tableViewVC;
    
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)awakeFromNib {
    
    [super awakeFromNib];
    [self setupUI];
    
    
    //_tableViewVC.tableView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1];
}

- (void)setupUI{
    
    _tableViewVC = [[QLMPurchasedContentController alloc]init];
    
    _tableViewVC.tableView.frame = self.contentView.bounds;
    
    [self.contentView addSubview:_tableViewVC.tableView];
    
}

@end
