//
//  QLMCyclePageControl.h
//  Qomolangma
//
//  Created by 张晨晖 on 2017/3/17.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QLMCyclePageControl : UIPageControl

//声明pageControl点的样式枚举
typedef enum : NSInteger{
    /**
     默认类型:圆形
     */
    XMHPageControlStyleDefaoult = 0,
    /**
     正方形
     */
    XMHPageControlStyleSquare,
    /**
     <<<缩略图>>>!!!
     */
    XMHPageControlStyleImages,
}XMHPageControlStyle;

@property(nonatomic, assign)NSInteger pageNumber;//点的个数
@property(nonatomic, assign)CGFloat pageSpace;//点的间隔
@property(nonatomic, strong)UIColor *pageBackgroundColor;//点的背景颜色
@property(nonatomic, strong)UIColor *selectedColor;//选中的背景色
@property(nonatomic, assign)NSInteger currentPageNumber;//当前点击的pageNumber
@property(nonatomic, assign)XMHPageControlStyle pageStyle;//当前pageControl样式
@property(nonatomic, strong)NSMutableArray *imageArray;
//初始化方法
-(instancetype)initWithFrame:(CGRect)frame pageStyle:(XMHPageControlStyle)pageStyle withImageArray:(NSMutableArray *)imageArray;

@end
