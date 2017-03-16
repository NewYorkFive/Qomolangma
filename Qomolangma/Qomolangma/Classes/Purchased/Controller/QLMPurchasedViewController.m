//
//  QLMPurchasedViewController.m
//  Qomolangma
//
//  Created by NowOrNever on 15/03/2017.
//  Copyright © 2017 Focus. All rights reserved.
//

#import "QLMPurchasedViewController.h"
#import "QLMPurchasedModel.h"
#import "QLMPurchasedLable.h"
#import "QLMPurchasedFlowLayout.h"

///已购Lable 高度
#define labSVHeight 44

@interface QLMPurchasedViewController () <UICollectionViewDelegate,UICollectionViewDataSource>

//已购Label视图
@property (nonatomic,strong) UIScrollView *labScrollView;

//已购内容视图
@property (nonatomic,strong) UICollectionView *purCollentionView;

//已购label数据源
@property (nonatomic,strong) NSArray *purchasedModelData;

//记录已购label
@property (nonatomic,strong) NSMutableArray *labArray;

@end

@implementation QLMPurchasedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
  
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //已购标签视图
    [self requestPurchaseData];
    
    //已购内容视图
    [self setupPurchasedCollectionView];
    
}

#pragma  mark - 2.设置已购内容视图
- (void)setupPurchasedCollectionView {
    
    //创建layout
    QLMPurchasedFlowLayout *flowLaout = [[QLMPurchasedFlowLayout alloc]init];
    
    //创建已购内容视图
    self.purCollentionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, labSVHeight + kNavBarHeight, self.view.bounds.size.width, self.view.bounds.size.height - (labSVHeight + kNavBarHeight)) collectionViewLayout:flowLaout];
    
    //遵守数据源和代理
   self.purCollentionView.delegate = self;
   self.purCollentionView.dataSource = self;
    
    //注册
    [self.purCollentionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cellid"];
    
    //添加视图
    [self.view addSubview:self.purCollentionView];
    
    //取消弹簧效果
    self.purCollentionView.bounces = NO;
    
    //取消滚动条
    self.purCollentionView.showsVerticalScrollIndicator = NO;
    self.purCollentionView.showsHorizontalScrollIndicator = NO;
    
    //设置分页效果
    self.purCollentionView.pagingEnabled = YES;
    
    //设置预加载cell
    self.purCollentionView.prefetchingEnabled = YES;
    
    
    
}

#pragma  mark - 数据源方法
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    
    return  self.purchasedModelData.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellid" forIndexPath:indexPath];
    
    
    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1];
    
    return cell;
    
}


#pragma  mark - 1.设置已购Label标签
- (void)requestPurchaseData {
    
    //记录purchasedLabel数据源
    self.purchasedModelData = [QLMPurchasedModel getPurchasedModelData];
    
    //初始化
    self.labArray = [NSMutableArray array];
    
    //已购label的大小
    CGFloat labelWidth = kScreenWidth / 5;
    
    for (int i = 0; i < self.purchasedModelData.count; i++) {
        
        QLMPurchasedModel *model = self.purchasedModelData[i];
        
        //NSLog(@"%@",model);
        
        //创建label
        QLMPurchasedLable *purchasedLabel = [[ QLMPurchasedLable alloc]initWithFrame:CGRectMake(i * labelWidth, 0, labelWidth, labSVHeight)];
        
        //QLMPurchasedLable *purchasedLabel = [[ QLMPurchasedLable alloc]init];
        
        //获取显示内容
        purchasedLabel.text = model.tname;

        //设置文字大小和居中显示
        purchasedLabel.font = [UIFont systemFontOfSize:15];
        purchasedLabel.textAlignment = NSTextAlignmentCenter;
        
        //添加
        [self.labScrollView addSubview:purchasedLabel];
        
        //开启用户交互
        purchasedLabel.userInteractionEnabled = YES;
        
        //创建手势
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGesturePurchasedLableAction:)];
        
        //添加手势
        [purchasedLabel addGestureRecognizer:tapGesture];
        
        //设置tag
        purchasedLabel.tag = i;
        
        //记录已购Label
        [self.labArray addObject:purchasedLabel];
        
        
    }
    
    //[_labArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    
    //设置scrollview的滚动范围
    self.labScrollView.contentSize = CGSizeMake(labelWidth * self.purchasedModelData.count, 0);
    
    //取消滚动条
    self.labScrollView.showsVerticalScrollIndicator = NO;
    self.labScrollView.showsHorizontalScrollIndicator = NO;
    
    
    
}

#pragma  mark - 点击已购Label 滚动对应已购内容视图
- (void)tapGesturePurchasedLableAction:(UITapGestureRecognizer *)gesture {
    
    //获取已购Label
    QLMPurchasedLable *purchasedLabel = (QLMPurchasedLable *)gesture.view;
    
    //创建滚动的indexPath
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:purchasedLabel.tag inSection:0];
    
    //滚动已购内容视图
    [self.purCollentionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
    
    
    
}

#pragma  mark - 懒加载
- (UIScrollView *)labScrollView {
    
    if (!_labScrollView) {
        
        self.labScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, kNavBarHeight, self.view.bounds.size.width, labSVHeight)];
        
        self.labScrollView.backgroundColor = [UIColor colorWithRed:.9 green:.9 blue:.9 alpha:1];
        
        [self.view addSubview:self.labScrollView];
    }
    
    return _labScrollView;
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
