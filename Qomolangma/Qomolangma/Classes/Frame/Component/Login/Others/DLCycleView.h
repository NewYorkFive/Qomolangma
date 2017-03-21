//
//  DLCycleView.h
//  图片轮播器
//
//  Created by NowOrNever on 14/01/2017.
//  Copyright © 2017 NowOrNever. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DLCycleView : UIView

/**
 pageControl所在位置高度为当前view高度比例
 */
@property (nonatomic, assign) CGFloat pageControlRatio;
//@property (nonatomic, strong) NSArray<NSURL *> *imageUrls;

/**
 图片名称数组
 */
@property (nonatomic, strong) NSArray<NSString *> *imageNames;

/**
 pageControl的颜色
 */
@property (nonatomic, strong) UIColor *pageCurrentColor;

/**
 pageControl的背景色
 */
@property (nonatomic, strong) UIColor *pageBackGroundColor;
@end
