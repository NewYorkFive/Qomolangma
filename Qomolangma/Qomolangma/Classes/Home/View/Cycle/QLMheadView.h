//
//  QLMCarouselView.h
//  Qomolangma
//
//  Created by 张晨晖 on 2017/3/16.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QLMCarousel.h"

@interface QLMHeadView : UIView

@property (nonatomic, strong) NSArray<QLMCarousel *> *carouselArray;

@property (nonatomic, strong) NSArray *imageURLs;

@end
