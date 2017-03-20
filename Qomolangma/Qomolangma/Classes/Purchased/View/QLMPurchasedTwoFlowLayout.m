//
//  QLMPurchasedTwoFlowLayout.m
//  Qomolangma
//
//  Created by 王惠平 on 2017/3/18.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMPurchasedTwoFlowLayout.h"

@implementation QLMPurchasedTwoFlowLayout

- (void)prepareLayout {
    
    [super prepareLayout];
    
    //设置每个item大小
    self.itemSize = CGSizeMake(110, 150);
    
    self.sectionInset = UIEdgeInsetsMake(15, 15, 15, 15);

    //设置间距
    self.minimumLineSpacing = 10;
    self.minimumInteritemSpacing = 0;
    
    //设置滚动方向
    self.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    
}


@end
