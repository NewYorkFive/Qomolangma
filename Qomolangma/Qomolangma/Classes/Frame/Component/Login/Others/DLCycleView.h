//
//  DLCycleView.h
//  图片轮播器
//
//  Created by NowOrNever on 14/01/2017.
//  Copyright © 2017 NowOrNever. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DLCycleView : UIView

@property (nonatomic, assign) CGFloat pageControlRatio;
//@property (nonatomic, strong) NSArray<NSURL *> *imageUrls;
@property (nonatomic, strong) NSArray<NSString *> *imageNames;
@property (nonatomic, strong) UIColor *pageCurrentColor;
@property (nonatomic, strong) UIColor *pageBackGroundColor;
@end
