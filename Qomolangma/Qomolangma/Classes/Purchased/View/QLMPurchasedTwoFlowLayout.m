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
    self.itemSize = CGSizeMake(100, 170);
    
    self.sectionInset = UIEdgeInsetsMake(15, 15, 15, 15);

    //设置间距
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;
    
    //设置滚动方向
    self.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    
}

/*
 
 //设置每个item的尺寸
 - (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
 {
 return CGSizeMake(100, 170);
 }
 
 //设置section的高度
 - (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
 return CGSizeMake([UIScreen mainScreen].bounds.size.width, 30);
 }
 
 //设置每个item的UIEdgeInsets
 - (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
 {
 return UIEdgeInsetsMake(10, 10, 10, 10);
 }
 
 //设置每个item水平间距
 - (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
 {
 return 10;
 }
 
 //设置每个item垂直间距
 - (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
 {
 return 15;
 }
 
 - (void)didReceiveMemoryWarning {
 [super didReceiveMemoryWarning];
 // Dispose of any resources that can be recreated.
 }

 */


@end
