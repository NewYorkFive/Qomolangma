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
    
    // 设置layout参数
    // item大小
    self.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width , [UIScreen mainScreen].bounds.size.height );
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 1;
    // 滑动方向
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    
}
@end
