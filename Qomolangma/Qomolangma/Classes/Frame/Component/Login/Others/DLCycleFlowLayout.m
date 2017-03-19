//
//  DLCycleFlowLayout.m
//  图片轮播器
//
//  Created by NowOrNever on 14/01/2017.
//  Copyright © 2017 NowOrNever. All rights reserved.
//

#import "DLCycleFlowLayout.h"

@implementation DLCycleFlowLayout

- (void)prepareLayout{
    [super prepareLayout];
    self.itemSize = self.collectionView.bounds.size;
    
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;
    
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    
}

@end
