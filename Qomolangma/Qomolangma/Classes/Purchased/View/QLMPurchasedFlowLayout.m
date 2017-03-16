//
//  QLMPurchasedFlowLayout.m
//  Qomolangma
//
//  Created by 王惠平 on 2017/3/15.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMPurchasedFlowLayout.h"

@implementation QLMPurchasedFlowLayout

- (void)prepareLayout {
    
    [super prepareLayout];
    
    //设置每个item大小
    self.itemSize = CGSizeMake(self.collectionView.bounds.size.width, self.collectionView.bounds.size.height);
    
    //self.itemSize = CGSizeMake(80, 80);
    
    //设置间距
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;
    
    //设置滚动方向
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    

}


@end
