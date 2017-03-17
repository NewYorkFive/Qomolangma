//
//  QLMCarouselFlowLayout.m
//  Qomolangma
//
//  Created by 张晨晖 on 2017/3/16.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMHeadFlowLayout.h"

@implementation QLMHeadFlowLayout

- (void)prepareLayout {
    [super prepareLayout];
    
    //设置items的大小
    self.itemSize = self.collectionView.bounds.size;
    
    // 间距
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;
    
    // 滚动方向
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
}

@end
