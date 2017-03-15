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

@interface QLMPurchasedViewController ()

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
    [self requestPurchaseData];
    
    
}

- (void)requestPurchaseData {
    
    //记录purchasedLabel数据源
    self.purchasedModelData = [QLMPurchasedModel getPurchasedModelData];
    
    //初始化
    self.labArray = [NSMutableArray array];
    
    //已购label的大小
    CGFloat labelWidth = 85;
    CGFloat labelHeight = 44;
    
    for (int i = 0; i < self.purchasedModelData.count; i++) {
        
        QLMPurchasedModel *model = self.purchasedModelData[i];
        
        //NSLog(@"%@",model);
        
        //创建label
        QLMPurchasedLable *purchasedLabel = [[ QLMPurchasedLable alloc]initWithFrame:CGRectMake(i * labelWidth, 0, labelWidth, labelHeight)];
        
        //获取显示内容
        purchasedLabel.text = model.tname;
        
        //设置文字大小和居中显示
        purchasedLabel.font = [UIFont systemFontOfSize:15];
        purchasedLabel.textAlignment = NSTextAlignmentCenter;
        
        //添加
        [self.labScrollView addSubview:purchasedLabel];
        
        //设置scrollview的滚动范围
        self.labScrollView.contentSize = CGSizeMake(labelWidth * self.purchasedModelData.count, 0);
        
        //取消滚动条
        self.labScrollView.showsVerticalScrollIndicator = NO;
        self.labScrollView.showsHorizontalScrollIndicator = NO;
    }
    
    
    
}


#pragma  mark - 懒加载
- (UIScrollView *)labScrollView {
    
    if (!_labScrollView) {
        
        self.labScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, 44)];
        
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
