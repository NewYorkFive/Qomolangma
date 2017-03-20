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
#import "QLMJumpViewController.h"
#import "MJRefresh.h"
#import "QLMPurchasedModel.h"
#import "QLMNetworkTools.h"

#define labSVHeight 44
@interface QLMPurchasedTwoViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong)UICollectionView *collectionDay;

@property(nonatomic,strong)NSArray *arr;

@property(nonatomic,strong)NSArray<QLMPurchasedModel *> *purchasedModelArray;

@end

@implementation QLMPurchasedTwoViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];

    [self collectionViewDay];
}

- (void)loadData{
    [[QLMNetworkTools sharedTools] requestWithType:GET andUrlStr:@"/app/resource/getSubscribeList" andParams:nil andSuccess:^(id responseObject) {
        
        NSArray *array = ((NSDictionary *)responseObject)[@"data"];
        
        NSMutableArray *mArr = [NSMutableArray array];
        
        for (int i = 0; i < array.count; i++) {
           
            QLMPurchasedModel * model = [[QLMPurchasedModel alloc]init];
            
            [model setValuesForKeysWithDictionary:array[i]];
           
            [mArr addObject:model];

        }
        
        self.purchasedModelArray = mArr.copy;
        
        [self.collectionDay reloadData];
    
    } andFailture:^(NSError *error) {
        
        NSLog(@"Error:%@",error);
        
    }];
}

//关于collectionView的一些东西
-(void)collectionViewDay{
    
    //初始化layout
    QLMPurchasedTwoFlowLayout *layout =[[QLMPurchasedTwoFlowLayout alloc]init];
   
    //设置collectionView滚动方向
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
    //初始化collectionView
    self.collectionDay=[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 124) collectionViewLayout:layout];

    //#warning 下拉刷新...
    self.collectionDay.mj_header= [MJRefreshNormalHeader   headerWithRefreshingBlock:^{
        // 增加数据
        [self.collectionDay.mj_header beginRefreshing];
        
        //网络请求
        [self loadData];
        [self.collectionDay.mj_header endRefreshing];
        
    }];
    
    [self.view addSubview:self.collectionDay];
    
    //注册
    [self.collectionDay registerNib:[UINib nibWithNibName:@"QLMPurchasedCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"QLMPurchasedCell"];
    
    self.collectionDay.delegate=self;
    self.collectionDay.dataSource=self;
    
    self.collectionDay.backgroundColor=[UIColor whiteColor];
    
    //解决CollectionView的内容小于它的高度不能滑动的问题
    self.collectionDay.alwaysBounceVertical = YES;

}

//返回section个数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

//每个section的item个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.purchasedModelArray.count / 2;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    int i = arc4random_uniform(5);
    QLMPurchasedCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"QLMPurchasedCell" forIndexPath:indexPath];
    
    cell.model = self.purchasedModelArray[i * indexPath.row % self.purchasedModelArray.count];
    
    //设置圆角
    cell.layer.masksToBounds=YES;
    cell.layer.cornerRadius=5.0;
    cell.layer.borderWidth=1.0;
    cell.layer.borderColor = [[UIColor darkGrayColor]CGColor];

    return cell;
}

//点击item方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.item == 0) {
        
        QLMJumpViewController *vc = [[QLMJumpViewController alloc]init];
        
        UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:vc];
        nc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        
        //跳转
        [self.view.window.rootViewController presentViewController:nc animated:YES completion:nil];
    }
    
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
