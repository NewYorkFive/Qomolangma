//
//  QLMLearnCollectionViewCell.m
//  Qomolangma
//
//  Created by 刘康 on 2017/3/16.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMLearnCollectionViewCell.h"
#import "QLMPayedView.h"

@interface  QLMLearnCollectionViewCell()<QLMPayedViewDelegate>
@property (nonatomic, strong) QLMPayedView *payedView;
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
    //添加两个tableView
    QLMPayedView *payedView = [[QLMPayedView alloc] initWithFrame:CGRectMake(0, 64, self.bounds.size.width, self.bounds.size.height) style:UITableViewStyleGrouped];
    self.payedView = payedView;
    [self.contentView addSubview:payedView];
    
    payedView.detailDelegate = self;
}

- (void)setBlock:(void (^)(UIViewController *))block{
    _block = block;
    self.payedView.block = block;
}

- (void)payedView:(QLMPayedView *)payedView withDetailsTableViewController:(QLMLearnDetailsTableViewController *)detailsTableViewVc withIndexPath:(NSIndexPath *)indexPath {
    [_learnCellDelegate learnCollectionViewCell:self withDetailsTableViewController:detailsTableViewVc WithIndexPath:indexPath];
}

@end
