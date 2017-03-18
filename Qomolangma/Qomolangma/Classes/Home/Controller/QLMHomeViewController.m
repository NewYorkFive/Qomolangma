//
//  QLMHomeViewController.m
//  Qomolangma
//
//  Created by NowOrNever on 15/03/2017.
//  Copyright © 2017 Focus. All rights reserved.
//

#import "QLMHomeViewController.h"
#import "QLMNetworkTools.h"
#import <Masonry.h>
#import "QLMheadView.h"
#import "QLMCarousel.h"
#import "QLMEverydayBook.h"
#import "QLMEverydayBookTableViewCell.h"
#import "QLMRankingData.h"
#import "QLMRankingDataTableViewCell.h"
#import "QLMHomeFootView.h"
#import "QLMRecommend.h"
#import "QLMSpecialColumn.h"
#import "QLMspecialColumnTableViewCell.h"
#import "QLMFreeAudio.h"
#import "QLMFreeAudioTableViewCell.h"

@interface QLMHomeViewController () <UITableViewDelegate ,UITableViewDataSource>

//网络请求标记参数
@property (nonatomic ,assign) BOOL needRefresh;

//提示没网的button
@property (nonatomic ,strong) UIButton *button;

//提示没网的label
@property (nonatomic ,strong) UILabel *label;

//tableview
@property (nonatomic ,strong) UITableView *tableView;

//主数据
@property (nonatomic ,strong) NSDictionary *homeDataDic;

//专门存储每个data对应的模型
@property (nonatomic ,strong) NSArray<NSArray *> *dataArray;

//无线轮播图
@property (nonatomic ,strong) NSArray<QLMCarousel *> *carouselArray;

//天天涨姿势
@property (nonatomic ,strong) NSArray<QLMFreeAudio *> *freeAudioArray;

//行业达人
@property (nonatomic ,strong) NSArray<NSArray <QLMSpecialColumn *> *> *specialColumnArray;

//今今乐道
@property (nonatomic ,strong) NSArray<QLMEverydayBook *> *everydayBookArray;

//热门排行榜
@property (nonatomic, strong) NSArray<QLMRankingData *> *rankingDataArray;

//底部视图
@property (nonatomic ,strong) NSArray<QLMRecommend *> *recommendArray;

@end

@implementation QLMHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    [self loadData];
    
}

#pragma 2 - 加载首页数据
- (void)loadData {
    
    //不可穿透
    self.navigationController.navigationBar.translucent = NO;
    self.tabBarController.tabBar.translucent = NO;
    
    
	NSString *URLStr = @"app/home/getHomeData";
    //更改一下超时请求时间
    [[QLMNetworkTools sharedTools].requestSerializer willChangeValueForKey:@"timeoutInterval"];
    [QLMNetworkTools sharedTools].requestSerializer.timeoutInterval = 5.f;
    [[QLMNetworkTools sharedTools].requestSerializer didChangeValueForKey:@"timeoutInterval"];
    [[QLMNetworkTools sharedTools] requestWithType:GET andUrlStr:URLStr andParams:nil andSuccess:^(id responseObject) {
        
//        NSLog(@"%@",self.button);
        if (self.button != nil && self.label != nil) {
            [self.button removeFromSuperview];
            [self.label removeFromSuperview];
        }
//        self.button = nil;
//        self.label = nil;
        
        //初始化tableView.
        self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
//        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.automaticallyAdjustsScrollViewInsets = NO;
        
        [self.view addSubview:self.tableView];
        [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.offset(0);
        }];
        //设置代理
        _tableView.dataSource = self;
        _tableView.delegate = self;
        
        
        
        //预估行高
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.estimatedRowHeight = 80;
        
        ///注册cell
        //注册天天涨姿势
        [self.tableView registerClass:[QLMFreeAudioTableViewCell class] forCellReuseIdentifier:@"QLMFreeAudioTableViewCell"];
        //注册行业达人
        [self.tableView registerClass:[QLMspecialColumnTableViewCell class] forCellReuseIdentifier:@"QLMspecialColumnTableViewCell"];
        //注册今今乐道cell
        [self.tableView registerClass:[QLMEverydayBookTableViewCell class] forCellReuseIdentifier:@"QLMEverydayBookTableViewCell"];
        //注册热门排行榜cell
        [self.tableView registerClass:[QLMRankingDataTableViewCell class] forCellReuseIdentifier:@"QLMRankingDataTableViewCell"];
        
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
        QLMHomeFootView *footView = [[QLMHomeFootView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 180)];
        footView.recommendArray = self.recommendArray;
        self.tableView.tableFooterView = footView;
//        self.tableView.tableFooterView.frame = CGRectMake(0, 0, kScreenWidth, 160);
        
        
#pragma 各个不同的cell
        //天天涨姿势
        //今今乐道
        NSArray *freeAudioArray = [self.homeDataDic objectForKey:@"free_audio"];
        for (int i = 0; i < freeAudioArray.count; i++) {
            NSDictionary *dic = [freeAudioArray objectAtIndex:i];
            QLMFreeAudio *freeAudio = [QLMFreeAudio yy_modelWithJSON:dic];
            [arrayM addObject:freeAudio];
        }
        self.freeAudioArray = arrayM.copy;
        [arrayM2 addObject:arrayM.copy];
        //模型给完一次.赋值一次给dataArrayM
        [dataArrayM addObject:arrayM2.copy];
        //用完一次清理一次数据
        [arrayM removeAllObjects];
        [arrayM2 removeAllObjects];

        
        
        //行业达人
        NSArray *specialColumnArray = [self.homeDataDic objectForKey:@"special_column"];
        for (int i = 0; i < specialColumnArray.count; i++) {
            NSDictionary *dic = [specialColumnArray objectAtIndex:i];
            QLMSpecialColumn *specialColumn = [QLMSpecialColumn yy_modelWithJSON:dic];
            [arrayM addObject:specialColumn];
        }
        NSArray *array = arrayM.copy;
        //搞三个数组包装一下
        NSMutableArray *arrayM3 = [NSMutableArray array];
        NSMutableArray *arrayM4 = [NSMutableArray array];
        
        for (int i = 0; i < array.count; i++) {
            if (i * 3 <= array.count) { //因为这里array已经是copy拷贝的,所以不用copy了
                [arrayM2 addObject:array[i]];
            } else if (i  <= array.count * 2 / 3) {
                [arrayM3 addObject:array[i]];
            } else {
                [arrayM4 addObject:array[i]];
            }
        }
        //移除一下
        [arrayM removeAllObjects];
        [arrayM addObject:arrayM2.copy];
        [arrayM addObject:arrayM3.copy];
        [arrayM addObject:arrayM4.copy];
        self.specialColumnArray = arrayM.copy;
        //模型给完一次.赋值一次给dataArrayM
        [dataArrayM addObject:self.specialColumnArray.copy];
        
        //用完一次清理一次数据
        [arrayM removeAllObjects];
        [arrayM2 removeAllObjects];
        [arrayM3 removeAllObjects];
        [arrayM4 removeAllObjects];
        
        
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
        
        //更改需要网络请求
        self.needRefresh = YES;
        //没有网络的按钮
        
        self.button = [[UIButton alloc] init];
        [_button setImage:[UIImage imageNamed:@"empty_placeholder"] forState:UIControlStateNormal];
        [self.view addSubview:_button];
        [_button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
        [_button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view.mas_centerX);
            make.top.offset(160);
        }];
        //添加一个label
        self.label = [[UILabel alloc] init];
        [self.view addSubview:_label];
        _label.text = @"网络错误";
        _label.font = [UIFont systemFontOfSize:16];
        _label.textColor = [UIColor grayColor];
        [_label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_button);
            make.top.equalTo(_button.mas_bottom);
        }];
        
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"没有网络" preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:alert animated:YES completion:^{
            //完成取消
            [NSThread sleepForTimeInterval:.5f];
            [alert dismissViewControllerAnimated:YES completion:nil];
            
        }];
    }];
    
}

- (void)buttonAction {
    
    if (self.needRefresh == YES) {
        [self loadData];
    }
    
    //更改网络请求状态
    self.needRefresh = NO;
    
}

#pragma 3 - cell测试
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.dataArray.count;
//    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArray[section].count;
//    return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
        //天天涨姿势
        QLMFreeAudioTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QLMFreeAudioTableViewCell" forIndexPath:indexPath];
        //传递数据
        cell.freeAudioArray = self.freeAudioArray;
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        return cell;
        
    }

    if (indexPath.section == 1) { //行业达人
        
        QLMspecialColumnTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QLMspecialColumnTableViewCell" forIndexPath:indexPath];
        if (indexPath.row == 0) {
    
            //行业达人
            UILabel *label = [[UILabel alloc] init];
            label.text = @"行业达人";
            label.font = [UIFont systemFontOfSize:16];
            [cell.contentView addSubview:label];
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.offset(8);
                make.top.offset(16);
            }];
            cell.label = [[UILabel alloc] init];
            cell.label.backgroundColor = [UIColor grayColor];
            cell.label.alpha = .2;
            [cell.contentView addSubview:cell.label];
            [cell.label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.offset(16);
                make.right.offset(-16);
                make.height.offset(1);
                make.top.equalTo(label.mas_bottom).offset(16);
            }];
            
            
            //顶部"查看听书日历"
            UILabel *label2 = [[UILabel alloc] init];
            [cell.contentView addSubview:label2];
            label2.text = @"换一换";
            label2.font = [UIFont systemFontOfSize:12];
            label2.textColor = [UIColor grayColor];
            [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(label.mas_centerY);
                make.right.offset(-16);
            }];
            
            //小箭头
            UIImageView *imageView = [[UIImageView alloc] init];
            imageView.image = [UIImage imageNamed:@"home_icon_exchange"];
            [cell.contentView addSubview:imageView];
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(label.mas_centerY);
                make.right.equalTo(label2.mas_left);
            }];
            
            //传递数据
            cell.specialColumn = self.specialColumnArray[indexPath.row][arc4random_uniform((int)self.specialColumnArray[indexPath.row].count)];
            [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
            return cell;
            
        }
        
        cell.label = [[UILabel alloc] init];
        cell.label.backgroundColor = [UIColor grayColor];
        cell.label.alpha = .2;
        [cell.contentView addSubview:cell.label];
        [cell.label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.offset(0);
            make.height.offset(1);
            make.top.equalTo(cell.contentView.mas_top);
        }];
        
        //传递数据
        cell.specialColumn = self.specialColumnArray[indexPath.row][arc4random_uniform((int)self.specialColumnArray[indexPath.row].count)];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        return cell;
        
    } else if (indexPath.section == 2) {   //今今乐道
    
        //    测试了,没毛病
        QLMEverydayBookTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QLMEverydayBookTableViewCell" forIndexPath:indexPath];
        //    传递数据
        cell.everydayBook = self.everydayBookArray[indexPath.row];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        return cell;
        
    } else if (indexPath.section == 3) {  //热门排行榜
    
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

//#pragma 4 - 组间距
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

//    NSLog(@"section:%zd",section);
//    NSIndexPath *indexPath = [[NSIndexPath alloc] initWithIndex:section];
    if (section == 0) {
        return 10;
    }
    return .1;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 10;
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat sectionHeaderHeight = 40;
    CGFloat sectionFooterHeight = 10;
    CGFloat offsetY = scrollView.contentOffset.y;
    if (offsetY >= 0 && offsetY <= sectionHeaderHeight)
    {
        scrollView.contentInset = UIEdgeInsetsMake(-offsetY, 0, -sectionFooterHeight, 0);
    }else if (offsetY >= sectionHeaderHeight && offsetY <= scrollView.contentSize.height - scrollView.frame.size.height - sectionFooterHeight)
    {
        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, -sectionFooterHeight, 0);
    }else if (offsetY >= scrollView.contentSize.height - scrollView.frame.size.height - sectionFooterHeight && offsetY <= scrollView.contentSize.height - scrollView.frame.size.height)
    {
        scrollView.contentInset = UIEdgeInsetsMake(-offsetY, 0, -(scrollView.contentSize.height - scrollView.frame.size.height - sectionFooterHeight), 0);
    }
}

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    CGFloat sectionHeaderHeight = 40;
//    if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
//        scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
//    }
//    else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
//        scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
//    }
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
