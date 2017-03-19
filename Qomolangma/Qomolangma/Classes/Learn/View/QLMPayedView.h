//
//  QLMPayedView.h
//  Qomolangma
//
//  Created by 刘康 on 2017/3/16.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QLMLearnDetailsTableViewController.h"
#import "QLMLearnFirstCellModel.h"
@class QLMPayedView;
@protocol QLMPayedViewDelegate <NSObject>

- (void)payedView:(QLMPayedView *)payedView withDetailsTableViewController:(QLMLearnDetailsTableViewController *)learnDetails withIndexPath:(NSIndexPath *)indexPath;

@end

@interface QLMPayedView : UITableView

//@property (nonatomic,copy) void(^block)(QLMLearnDetailsTableViewController *vc,QLMLearnFirstCellModel *model);
@property (nonatomic,copy) void(^block)(QLMLearnDetailsTableViewController *vc);

@property (nonatomic, weak) id <QLMPayedViewDelegate>detailDelegate;
///
//@property (nonatomic, copy) QLMLearnFirstCellModel *model;

@end
