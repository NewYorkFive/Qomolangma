//
//  QLMPurchasedViewController.m
//  Qomolangma
//
//  Created by 王惠平 on 2017/3/15.
//  Copyright © 2017年 Focus. All rights reserved.
//


#import "QLMPurchasedViewController.h"
#import "QLMPurchasedModel.h"
#import "QLMPurchasedLable.h"
#import "QLMPurchasedFlowLayout.h"
#import "UIColor+FCSColor.h"
#import "QLMPurchasedCollectionViewCell.h"

///已购Lable 高度
#define labSVHeight 44

@interface QLMPurchasedViewController () <UICollectionViewDelegate,UICollectionViewDataSource>

//已购Label视图
@property (nonatomic, strong) UIView *labelView;

//已购内容视图
@property (nonatomic,strong) UICollectionView *purCollentionView;

//已购label数据源
@property (nonatomic,strong) NSArray *purchasedModelData;

//记录已购label
@property (nonatomic,strong) NSMutableArray *labArray;

@property (nonatomic, strong) NSArray<QLMPurchasedLable *> *purchasedLabelArray;

@end

@implementation QLMPurchasedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
  
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //已购标签
    [self setupLabelView];
    
    //已购内容视图
    [self setupPurchasedCollectionView];
    
}

#pragma  mark - 已购标签界面搭建
- (void)setupLabelView
{
    self.labelView = [[UIView alloc] initWithFrame:CGRectMake(0, kNavBarHeight, kScreenWidth, labSVHeight)];
    
    self.labelView.backgroundColor = [UIColor colorWithRed:.9 green:.9 blue:.9 alpha:1];
    
    NSArray *titlesArray = @[@"全部", @"每天听本书", @"精选音频", @"电子书", @"订阅"];
    
    [self.view addSubview:self.labelView];
    
    NSMutableArray *purchasedLabelArray = [NSMutableArray array];
    NSMutableArray *labelWidthArray = [NSMutableArray array];
    
    CGFloat totalWidth = 0.0;
    
    for (NSInteger i = 0 ; i < titlesArray.count; i++)
    {
        QLMPurchasedLable *label = [QLMPurchasedLable qlm_labelWithColor:[UIColor colorWithRed:140 / 255.0 green:124 / 255.0 blue:108 / 255.0 alpha:1] andFontSize:15 andText:titlesArray[i]];
        
        label.tag = i;
        
        if (i == 0) {
            
            label.textColor = [UIColor blackColor];
        }
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        
        [label addGestureRecognizer:tap];
        
        [label sizeToFit];
      
        totalWidth += label.bounds.size.width;
        
        [labelWidthArray addObject:@(label.bounds.size.width)];
        
        [self.labelView addSubview:label];
        
        [purchasedLabelArray addObject:label];
        
    }
    
    self.purchasedLabelArray = purchasedLabelArray.copy;
    
    CGFloat margin = (kScreenWidth - totalWidth) / (self.purchasedLabelArray.count + 1);
    
    CGFloat x = margin;
    
    for (NSInteger i = 0 ; i < purchasedLabelArray.count ; i++ )
    {
        self.purchasedLabelArray[i].frame = CGRectMake(x, 0, [labelWidthArray[i] floatValue], self.labelView.bounds.size.height);
        x += margin;
        x += [labelWidthArray[i] floatValue];
    }

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
    [self.purCollentionView registerClass:[QLMPurchasedCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
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
    
        UIButton *button = [[UIButton alloc]init];
        
        [button setImage:[UIImage imageNamed:@"empty_placeholder"] forState: UIControlStateNormal];
        
        [self.view addSubview:button];
        
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view.mas_centerX);
            make.top.equalTo(self.view).offset(100 + kNavBarHeight);;
        }];
        
        UILabel *label = [[UILabel alloc]init];
        
        label.text = @"购买过得商品会自动添加到已购";
        
        [self.view addSubview:label];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.equalTo(self.view.mas_centerX);
            make.top.equalTo(button.mas_bottom).offset(20);
        }];

    
    return self.purchasedLabelArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    QLMPurchasedCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    
    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1];
    
    
    
    
    return cell;
    
}

#pragma  mark - 已购内容视图结束时调用
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    //计算滚动页数的索引
    int index = scrollView.contentOffset.x / scrollView.frame.size.width;
    
    //根据索引获取频道标签
    QLMPurchasedLable *purchasedLabel = self.purchasedLabelArray[index];
    
    //遍历频道数组,判断点击的频道和数组里的Label进行查找,找到了就改变颜色,否则保持默认状态
    for (QLMPurchasedLable *label in self.purchasedLabelArray) {
        
        if (purchasedLabel == label) {

            label.textColor = [UIColor blackColor];
            label.scalePercent = 1;
            
        } else {
            
            label.textColor = [UIColor colorWithRed:140 / 255.0 green:124 / 255.0 blue:108 / 255.0 alpha:1];
            label.scalePercent = 0;
        }
    }
    
}

#pragma  mark - 滚动已购内容视图 移动Label
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    //计算小数索引
    CGFloat floatIndex = scrollView.contentOffset.x / scrollView.frame.size.width;
    //NSLog(@"%f",floatIndex);
    
    //计算整数索引
    int intIndex = scrollView.contentOffset.x / scrollView.frame.size.width;
    
    //获取本分比
    CGFloat precent = floatIndex - intIndex;
    
    //左边标签的百分比
    CGFloat leftPrecent = 1 - precent;
    
    //右边标签的本分比
    CGFloat rightPrecent = precent;
    
    //NSLog(@"左边: %f,右边: %f", leftPrecent, rightPrecent);
    
    //计算左边标签的索引
    int leftIndex = intIndex;
    
    //计算右边标签的索引
    int rightIndex = intIndex + 1;
    
    //根据索引获取标签
    QLMPurchasedLable *leftPurchasedLabel = self.purchasedLabelArray[leftIndex];

    leftPurchasedLabel.scalePercent = leftPrecent;
    
    //判断右边的频道标签是否超出可用范围
    if (rightIndex < self.labArray.count) {
        
        QLMPurchasedLable *rightPurchasedLabel = self.purchasedLabelArray[rightIndex];
        
        rightPurchasedLabel.scalePercent = rightPrecent;
        
    }
    
}

#pragma mark - 已购Label点击事件
- (void)tapAction: (UITapGestureRecognizer *)sender
{
    //获取已购Label
    QLMPurchasedLable *purchasedLabel = (QLMPurchasedLable *)sender.view;
    
    //创建滚动的indexPath
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:purchasedLabel.tag inSection:0];
    
    //滚动已购内容视图
    [self.purCollentionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
    
    //遍历频道数组,判断点击的频道和数组里的Label进行查找,找到了就放大和改变颜色,否则保持默认状态
    for (QLMPurchasedLable *label in self.purchasedLabelArray) {
        
        if (purchasedLabel == label) {
            
            label.textColor = [UIColor blackColor];
            label.scalePercent = 1;
            
        } else {
            label.textColor = [UIColor colorWithRed:140 / 255.0 green:124 / 255.0 blue:108 / 255.0 alpha:1];
            label.scalePercent = 0;
            
        }
    }
    
}



- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

@end
