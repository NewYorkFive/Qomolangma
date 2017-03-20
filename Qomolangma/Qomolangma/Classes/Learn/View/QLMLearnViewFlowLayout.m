//
//  QLMLearnViewFlowLayout.m
//  Qomolangma
//
//  Created by 刘康 on 2017/3/16.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMLearnViewFlowLayout.h"

@implementation QLMLearnViewFlowLayout
- (void)prepareLayout {
    [super prepareLayout];
    self.itemSize = self.collectionView.bounds.size;
    
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 1;
    // 滑动方向
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    
}
@end
