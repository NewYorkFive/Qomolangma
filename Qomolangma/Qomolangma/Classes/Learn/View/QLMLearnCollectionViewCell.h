//
//  QLMLearnCollectionViewCell.h
//  Qomolangma
//
//  Created by 刘康 on 2017/3/16.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QLMLearnDetailsTableViewController.h"

@class QLMLearnCollectionViewCell;
@protocol QLMLearnCollectionViewCellDelegate <NSObject>

- (void)learnCollectionViewCell:(QLMLearnCollectionViewCell *)learnCollectionViewCell withDetailsTableViewController:(QLMLearnDetailsTableViewController *)detailsTableViewVc WithIndexPath:(NSIndexPath *)indexPath;

@end

@interface QLMLearnCollectionViewCell : UICollectionViewCell

@property (nonatomic, weak) id<QLMLearnCollectionViewCellDelegate>learnCellDelegate;
@end
