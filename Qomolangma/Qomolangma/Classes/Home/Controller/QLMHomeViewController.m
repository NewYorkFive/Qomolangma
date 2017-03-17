//
//  QLMHomeViewController.m
//  Qomolangma
//
//  Created by NowOrNever on 15/03/2017.
//  Copyright © 2017 Focus. All rights reserved.
//

#import "QLMHomeViewController.h"
#import "QLMNetworkTools.h"
#import "QLMheadView.h"
#import "QLMCarousel.h"
#import "QLMEverydayBook.h"
#import "QLMEverydayBookTableViewCell.h"
#import "QLMRankingData.h"
#import "QLMRankingDataTableViewCell.h"
#import "QLMHomeFootView.h"
#import "QLMRecommend.h"

@interface QLMHomeViewController ()

//主数据
@property (nonatomic ,strong) NSDictionary *homeDataDic;

//专门存储每个data对应的模型
@property (nonatomic ,strong) NSArray<NSArray *> *dataArray;

//无线轮播图
@property (nonatomic ,strong) NSArray<QLMCarousel *> *carouselArray;

//今今乐道
@property (nonatomic ,strong) NSArray<QLMEverydayBook *> *everydayBookArray;

//热门排行榜
@property (nonatomic, strong) NSArray<QLMRankingData *> *rankingDataArray;

//底部视图
@property (nonatomic ,strong) NSArray<QLMRecommend *> *recommendArray;

@end

@implementation QLMHomeViewController

#pragma 1 - 创建UITableView
//- (instancetype)init {
//    
//    return [self initWithStyle:UITableViewStylePlain];
//    
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    [self loadData];

    
    //预估行高
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 80;
    
    
//    self.tableView.rowHeight = 200;
    
    ///注册cell
    //注册今今乐道cell
    [self.tableView registerClass:[QLMEverydayBookTableViewCell class] forCellReuseIdentifier:@"QLMEverydayBookTableViewCell"];
    //注册热门排行榜cell
    [self.tableView registerClass:[QLMRankingDataTableViewCell class] forCellReuseIdentifier:@"QLMRankingDataTableViewCell"];
    
}

#pragma 2 - 加载首页数据
- (void)loadData {
    
	NSString *URLStr = @"app/home/getHomeData";
    [[QLMNetworkTools sharedTools] requestWithType:GET andUrlStr:URLStr andParams:nil andSuccess:^(id responseObject) {
        
        //拿到主数据
        NSDictionary *dic = responseObject;
        self.homeDataDic = [dic objectForKey:@"data"];
        
        //用来专门存放cell信息的
        NSMutableArray *dataArrayM = [NSMutableArray array];
        //专门用来解析数据存储的
        NSMutableArray *arrayM = [NSMutableArray array];
        //专门做包装的数组
        NSMutableArray *arrayM2 = [NSMutableArray array];
        
        //给所有模型赋值
        //无限轮播图
        NSArray *carouselArray = [self.homeDataDic objectForKey:@"carousel"];
        for (int i = 0; i < carouselArray.count; i++) {
            NSDictionary *dic = [carouselArray objectAtIndex:i];
            QLMCarousel *everydayBook = [QLMCarousel yy_modelWithJSON:dic];
            [arrayM addObject:everydayBook];
        }
        self.carouselArray = arrayM.copy;
        [arrayM2 addObject:arrayM.copy];
        //模型给完一次.赋值一次给dataArrayM
//        [dataArrayM addObject:arrayM2.copy];  //由于轮播图不在cell内.可以不添加
        //用完一次清理一次数据
        [arrayM removeAllObjects];
        [arrayM2 removeAllObjects];
        //设置头部视图
        QLMHeadView *headView = [[QLMHeadView alloc] init];
        headView.carouselArray = self.carouselArray;
        self.tableView.tableHeaderView = headView;
        self.tableView.tableHeaderView.bounds = CGRectMake(0, 0, 0, 140);
        
        //加载尾部数据
        NSArray *recommendArray = [self.homeDataDic objectForKey:@"recommend"];
        for (int i = 0; i < recommendArray.count; i++) {
            NSDictionary *dic = [recommendArray objectAtIndex:i];
            QLMRecommend *everydayBook = [QLMRecommend yy_modelWithJSON:dic];
            [arrayM addObject:everydayBook];
        }
        self.recommendArray = arrayM.copy;
        [arrayM2 addObject:arrayM.copy];
        //模型给完一次.赋值一次给dataArrayM
        //        [dataArrayM addObject:arrayM2.copy];  //由于轮播图不在cell内.可以不添加
        //用完一次清理一次数据
        [arrayM removeAllObjects];
        [arrayM2 removeAllObjects];
        QLMHomeFootView *footView = [[QLMHomeFootView alloc] init];
        footView.recommendArray = self.recommendArray;
        self.tableView.tableFooterView = footView;
        self.tableView.tableFooterView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 160);
        
        
        //行业达人
        
        
        //今今乐道
        NSArray *everydayBookArray = [self.homeDataDic objectForKey:@"everyday_book"];
        for (int i = 0; i < everydayBookArray.count; i++) {
            NSDictionary *dic = [everydayBookArray objectAtIndex:i];
            QLMEverydayBook *everydayBook = [QLMEverydayBook yy_modelWithJSON:dic];
            [arrayM addObject:everydayBook];
        }
        self.everydayBookArray = arrayM.copy;
        [arrayM2 addObject:arrayM.copy];
        //模型给完一次.赋值一次给dataArrayM
        [dataArrayM addObject:arrayM2.copy];
        //用完一次清理一次数据
        [arrayM removeAllObjects];
        [arrayM2 removeAllObjects];
        
        //热门排行榜
        NSArray *rankingDataArray = [[self.homeDataDic objectForKey:@"ranking_data"] objectForKey:@"data"];
        for (int i = 0; i < rankingDataArray.count; i++) {
            NSDictionary *dic = [rankingDataArray objectAtIndex:i];
            QLMRankingData *rankingData = [QLMRankingData yy_modelWithJSON:dic];
            [arrayM addObject:rankingData];
        }
        self.rankingDataArray = arrayM.copy;
        [arrayM2 addObject:arrayM.copy];
        //模型给完一次.赋值一次给dataArrayM
        [dataArrayM addObject:arrayM2.copy];
        //用完一次清理一次数据
        [arrayM removeAllObjects];
        [arrayM2 removeAllObjects];
        
        //最后把所有的赋值给self.dataArray
        self.dataArray = dataArrayM.copy;
        //刷新数据
        [self.tableView reloadData];
        
    } andFailture:^(NSError *error) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"没有网络" preferredStyle:UIAlertControllerStyleAlert];
        
        [self presentViewController:alert animated:YES completion:^{
        
            //完成取消
            [NSThread sleepForTimeInterval:.5f];
            [alert dismissViewControllerAnimated:YES completion:nil];
            
        }];
    }];
    
}

#pragma 3 - cell测试
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
//    return self.dataArray.count;
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

//    return self.dataArray[section].count;
    return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    
    
    if (indexPath.section == 0) {   //今今乐道
    
        //    测试了,没毛病
        QLMEverydayBookTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QLMEverydayBookTableViewCell" forIndexPath:indexPath];
        //    传递数据
        cell.everydayBook = self.everydayBookArray[indexPath.row];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        return cell;
        
    } else if (indexPath.section) {  //热门排行榜
    
        QLMRankingDataTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QLMRankingDataTableViewCell" forIndexPath:indexPath];
        //传递数据
        //这里是array<模型>直接返回
        cell.rankingDataArray = self.rankingDataArray;
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        return cell;
        
    }
    
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    //取消选中效果
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;

}

#pragma 4 - 组间距
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 10;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
