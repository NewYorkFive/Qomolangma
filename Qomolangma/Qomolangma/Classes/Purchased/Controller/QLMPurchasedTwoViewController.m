//
//  QLMPurchasedTwoViewController.m
//  Qomolangma
//
//  Created by 王惠平 on 2017/3/18.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMPurchasedTwoViewController.h"
#import "QLMPurchasedTwoFlowLayout.h"
#import "QLMPurchasedCell.h"
#import <UIImageView+WebCache.h>

#define labSVHeight 44
@interface QLMPurchasedTwoViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic)UICollectionView *collectionDay;

@property(nonatomic,strong)NSArray *arr;

@end

@implementation QLMPurchasedTwoViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self collectionViewDay];
}

//关于collectionView的一些东西
-(void)collectionViewDay{
    
    //初始化layout
    UICollectionViewFlowLayout *layout =[[UICollectionViewFlowLayout alloc]init];
   
    //设置collectionView滚动方向
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    //设置headerView的尺寸大小
    layout.headerReferenceSize=CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    
    //该方法也可以设置itemSize
    layout.itemSize=CGSizeMake(110, 150);
    
    //初始化collectionView
    self.collectionDay=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height-124) collectionViewLayout:layout];
    [self.view addSubview:self.collectionDay];
    
    //注册
    [self.collectionDay registerNib:[UINib nibWithNibName:@"QLMPurchasedCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"QLMPurchasedCell"];
    
    [self.collectionDay registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusableView"];
    
    self.collectionDay.delegate=self;
    self.collectionDay.dataSource=self;
    
    self.collectionDay.backgroundColor=[UIColor whiteColor];
    
    
    self.arr=@[@"http://img4.duitang.com/uploads/item/201506/18/20150618181443_Frv2V.jpeg",@"http://imgphoto.gmw.cn/attachement/jpg/site2/20120504/f04da22dd51e110d929e38.jpg",@"http://dynamic-image.yesky.com/740x-/uploadImages/2015/329/42/A040IVFHMXTV.jpg",@"http://i3.s2.dpfile.com/pc/wed/87a8c4289fa52bf74bc148a4c8da6990%28640c480%29/thumb.jpg",@"http://imga1.pic21.com/bizhi/140212/07423/s10.jpg",@"http://i1.s2.dpfile.com/pc/577ca5f02a2b820a1747bd55c3b49462%28740x2048%29/thumb.jpg",@"http://i1.s2.dpfile.com/pc/aa7154ccb9cc9e05d2a2428ce2ec417e(740x2048)/thumb.jpg",@"http://i2.s1.dpfile.com/pc/wed/7a1a44797c2ba347d38436773e8985f3(640c480)/thumb.jpg",@"http://qcloud.dpfile.com/wed/hzW0qjCDMTK11yO8vXPNjXDaXVk4UMN9nDvLX-tYQ2x-ejmT-iG_Go8fi3gIJIHgO3xc_zgr_wpcmvffXdGKhg.jpg"];
    
}

//返回section个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 4;
}

//每个section的item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.arr.count;
}

//这个你不知道可以撞墙了.没救了
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    QLMPurchasedCell *cell = (QLMPurchasedCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"QLMPurchasedCell" forIndexPath:indexPath];
    
    cell.botlabel.text=[NSString stringWithFormat:@"第%ld张",(long)indexPath.row];
    
    cell.botlabel.hidden=NO;
    
    [cell.babyImageView sd_setImageWithURL:[NSURL URLWithString:self.arr[indexPath.row]]];
    
    //设置圆角
    cell.layer.masksToBounds=YES;
    cell.layer.cornerRadius=5.0;
    cell.layer.borderWidth=1.0;
    cell.layer.borderColor=[[UIColor blackColor]CGColor];
    
    
    return cell;
}

//设置每个item的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(90, 130);
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
