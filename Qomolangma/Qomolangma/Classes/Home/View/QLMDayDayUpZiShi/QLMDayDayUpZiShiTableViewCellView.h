//
//  QLMDayDayUpZiShiTableViewCellView.h
//  Qomolangma
//
//  Created by 张晨晖 on 2017/3/20.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QLMDayDayUpZiShiTableViewCellView;
@protocol QLMDayDayUpZiShiTableViewCellViewDelegate <NSObject>

@optional
- (void)dayDayUpZiShiTableViewCellViewButtonClick;

@end

@interface QLMDayDayUpZiShiTableViewCellView : UIView

@property (nonatomic ,weak) id<QLMDayDayUpZiShiTableViewCellViewDelegate> delegate;

@end
