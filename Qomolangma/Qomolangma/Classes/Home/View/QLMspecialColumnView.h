//
//  QLMspecialColumnView.h
//  Qomolangma
//
//  Created by 张晨晖 on 2017/3/19.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QLMspecialColumnView;
@protocol QLMspecialColumnViewDelegate <NSObject>

@optional
- (void)specialColumnViewReloadData;

@end

@interface QLMspecialColumnView : UIView

@property (nonatomic ,weak) id<QLMspecialColumnViewDelegate> delegate;

@end
