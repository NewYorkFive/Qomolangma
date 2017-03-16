//
//  QLMLearnCollectionViewCell.m
//  Qomolangma
//
//  Created by 刘康 on 2017/3/16.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMLearnCollectionViewCell.h"
#import "QLMPayedView.h"

@interface  QLMLearnCollectionViewCell()

@end

@implementation QLMLearnCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupUI];
}

//自定义cell
- (void)setupUI {
    self.backgroundColor = [UIColor purpleColor];
    //添加两个tableView
    QLMPayedView *payedView = [[QLMPayedView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height) style:UITableViewStylePlain];
    
    [self.contentView addSubview:payedView];
    
    
}

@end
