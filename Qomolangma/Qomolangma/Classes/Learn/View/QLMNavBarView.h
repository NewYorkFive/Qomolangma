//
//  QLMNavBarView.h
//  Qomolangma
//
//  Created by 刘康 on 2017/3/16.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QLMNavBarView;
@protocol QLMNavBarViewDelegate <NSObject>

@optional
- (void)navBarView:(QLMNavBarView *)navBarView withPageNumber:(NSInteger)pageNumber;

@end

@interface QLMNavBarView : UIView

@property (nonatomic, assign) BOOL isSelectedPage;
@property (nonatomic, assign) CGFloat offsetX;
@property (nonatomic, weak)id <QLMNavBarViewDelegate>navBarDelegate;
@end
