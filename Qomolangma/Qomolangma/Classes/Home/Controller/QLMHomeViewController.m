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
#import "QLMspecialColumnView.h"
#import "QLMDayDayUpZiShiTableViewController.h"
#import "MJRefresh.h"
#import "QLMPlayListViewController.h"

@interface QLMHomeViewController () <UITableViewDelegate ,UITableViewDataSource,QLMspecialColumnViewDelegate ,QLMFreeAudioTableViewCellDelegate>

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

static int refreash1;
static int refreash2;
static int refreash3;

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    
    QLMFreeAudioTableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    
    if (cell.button6 != nil) {
        
        cell.isButtonSelected = [QLMPlayListViewController sharedPlayListViewController].playFlag;
        
    } else {

        cell.isButtonSelected = [QLMPlayListViewController sharedPlayListViewController].playFlag;
        
    }
    
}

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
    
    refreash1 = 0;
    refreash2 = 0;
    refreash3 = 0;
    
	NSString *URLStr = @"app/home/getHomeData";
    //更改一下超时请求时间
    [[QLMNetworkTools sharedTools].requestSerializer willChangeValueForKey:@"timeoutInterval"];
    [QLMNetworkTools sharedTools].requestSerializer.timeoutInterval = 5.f;
    [[QLMNetworkTools sharedTools].requestSerializer didChangeValueForKey:@"timeoutInterval"];
    [[QLMNetworkTools sharedTools] requestWithType:GET andUrlStr:URLStr andParams:nil andSuccess:^(id responseObject) {
        
        if (self.button != nil && self.label != nil) {
            [self.button removeFromSuperview];
            [self.label removeFromSuperview];
        }
        
        if (self.tableView != nil) {
            [self.tableView removeFromSuperview];            
            self.tableView = nil;
        }
        
        //初始化tableView.
        self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        [self.view addSubview:self.tableView];
        self.tableView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.automaticallyAdjustsScrollViewInsets = NO;
        [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.offset(0);
        }];
        
        //下拉刷新
        
        self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [self loadData];
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
        CGFloat headViewHeight = [UIScreen mainScreen].bounds.size.width * 13 / 25 * 2 / 3;
        self.tableView.tableHeaderView.bounds = CGRectMake(0, 0, 0, headViewHeight);
        
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
        CGFloat footViewHeight = [UIScreen mainScreen].bounds.size.height * 15 / 46;
        QLMHomeFootView *footView = [[QLMHomeFootView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, footViewHeight)];
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
        if (self.button == nil && self.label == nil) {
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
        }
        
        
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
        cell.delegate = self;
        //传递数据
        cell.freeAudioArray = self.freeAudioArray;
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        return cell;
        
    }

    if (indexPath.section == 1) { //行业达人
        
        QLMspecialColumnTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QLMspecialColumnTableViewCell" forIndexPath:indexPath];
        if (indexPath.row == 0) {
    
            cell.specialColumn = self.specialColumnArray[indexPath.row][refreash1];
            
        } else if (indexPath.row == 1) {
            
            cell.specialColumn = self.specialColumnArray[indexPath.row][refreash2];
            
        } else if (indexPath.row == 2) {
        
            cell.specialColumn = self.specialColumnArray[indexPath.row][refreash3];
        
        }
        
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

    if (section == 1) {
        return 50;
    }
    
    return 10;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    if (section == 0) {
        return 10;
    }
    
    if (section == self.dataArray.count - 1) {
        return 10;
    }
    
    return .1;
    
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

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    if (section == 1) {
        QLMspecialColumnView *view = [[QLMspecialColumnView alloc] init];
        view.delegate = self;
        return view;
        
    }
    return nil;
    
}

- (void)specialColumnViewReloadData {
    
    if (refreash1 == self.specialColumnArray[0].count - 1) {
        refreash1 = 0;
    }
    if (refreash2 == self.specialColumnArray[1].count - 1) {
        refreash2 = 0;
    }
    if (refreash3 == self.specialColumnArray[2].count - 1) {
        refreash3 = 0;
    }
    refreash1++;
    refreash2++;
    refreash3++;
    NSMutableArray *arrayM = [NSMutableArray array];
    for (int i = 0; i < self.specialColumnArray.count; i++) {
        
        [arrayM addObject:[NSIndexPath indexPathForRow:i inSection:1]];
        
    }
    /*
        UITableViewRowAnimationFade,
        UITableViewRowAnimationRight,           // slide in from right (or out to right)
        UITableViewRowAnimationLeft,
        UITableViewRowAnimationTop,
        UITableViewRowAnimationBottom,
        UITableViewRowAnimationNone,            // available in iOS 3.0
        UITableViewRowAnimationMiddle,          // available in iOS 3.2.  attempts to keep cell centered in the space it will/did occupy
        UITableViewRowAnimationAutomatic = 100  // available in iOS 5.0.  chooses an appropriate animation style for you
    */
    [self.tableView reloadRowsAtIndexPaths:arrayM.copy withRowAnimation:UITableViewRowAnimationAutomatic];
    [arrayM removeAllObjects];
     
}

- (void)pushAll {
    
    QLMDayDayUpZiShiTableViewController *tc2 = [[QLMDayDayUpZiShiTableViewController alloc] init];
    tc2.freeAudioArray = self.freeAudioArray;
    tc2.navigationItem.title = @"天天涨姿势";
    [self.navigationController pushViewController:tc2 animated:YES];
    
}

- (void)FreeAudioTableViewCellPushToPlayListViewControllerWithQLMPlayButton:(QLMPlayBtn *)button {
    
//    QLMPlayListViewController *vc = [QLMPlayListViewController sharedPlayListViewController];
    [QLMPlayListViewController sharedPlayListViewController].audioUrlString = button.freeAudio.audio_file_url;
    [QLMPlayListViewController sharedPlayListViewController].isVideo = NO;
//    [QLMPlayListViewController sharedPlayListViewController].playFlag = button.selected;
    [self.navigationController pushViewController:[QLMPlayListViewController sharedPlayListViewController] animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
