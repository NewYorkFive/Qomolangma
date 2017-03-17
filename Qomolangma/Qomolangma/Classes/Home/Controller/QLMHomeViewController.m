//
//  QLMHomeViewController.m
//  Qomolangma
//
//  Created by NowOrNever on 15/03/2017.
//  Copyright © 2017 Focus. All rights reserved.
//

#import "QLMHomeViewController.h"
#import "QLMNetworkTools.h"
#import "QLMHeadView.h"
#import "QLMEverydayBook.h"
#import "QLMEverydayBookTableViewCell.h"
#import "QLMRankingData.h"
#import "QLMRankingDataTableViewCell.h"
#import "QLMRecommend.h"

@interface QLMHomeViewController ()

//主数据
@property (nonatomic ,strong) NSDictionary *homeDataDic;

//今今乐道
@property (nonatomic ,strong) QLMEverydayBook *everydayBook;

//热门排行榜
@property (nonatomic, strong) NSArray<QLMRankingData *> *rankingDataArray;

//底部视图
@property (nonatomic ,strong) NSArray<QLMRecommend *> *recommendArray;

@end

@implementation QLMHomeViewController

#pragma 1 - 创建UITableView
- (instancetype)init {
    
    return [self initWithStyle:UITableViewStyleGrouped];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    [self loadData];
    
    //预估行高
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 70;
//    self.tableView.rowHeight = 100;
    
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
        
        NSDictionary *everydayBookDic = [[self.homeDataDic objectForKey:@"everyday_book"] firstObject];
        //给模型赋值
        self.everydayBook = [QLMEverydayBook yy_modelWithJSON:everydayBookDic];
//        NSLog(@"everydayBook:%@",self.everydayBook);
        
        
        NSArray *rankingDataArray = [[self.homeDataDic objectForKey:@"ranking_data"] objectForKey:@"data"];
//        NSLog(@"~~~~%@",rankingDataArray);
        NSMutableArray *arrayM = [NSMutableArray array];
        for (int i = 0; i < rankingDataArray.count; i++) {
            NSDictionary *dic = [rankingDataArray objectAtIndex:i];
            QLMRankingData *rankingData = [QLMRankingData yy_modelWithJSON:dic];
            [arrayM addObject:rankingData];
        }
        self.rankingDataArray = arrayM;
//        NSLog(@"%@",arrayM);
        
        
        NSArray *recommendArray = [self.homeDataDic objectForKey:@"recommend"];
        //用上面的arrayM,先清除所有的元素
        [arrayM removeAllObjects];
        for (int i = 0; i < recommendArray.count; i++) {
            NSDictionary *dic = [recommendArray objectAtIndex:i];
            QLMRecommend *rankingData = [QLMRecommend yy_modelWithJSON:dic];
            [arrayM addObject:rankingData];
        }
        self.recommendArray = arrayM;
//        NSLog(@"%@",self.recommendArray);
        
        
        
        
        
        
        //刷新数据
        [self.tableView reloadData];
        
    } andFailture:^(NSError *error) {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"没有网络" preferredStyle:UIAlertControllerStyleAlert];
        
        [self presentViewController:alert animated:YES completion:^{
        
            //完成取消
            [NSThread sleepForTimeInterval:.5f];
            [alert dismissViewControllerAnimated:YES completion:nil];
//            NSLog(@"error:%@",error);
            
        }];
    }];
    
}

#pragma 3 - cell测试
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

//    测试了,没毛病
    QLMEverydayBookTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QLMEverydayBookTableViewCell" forIndexPath:indexPath];
//    传递数据
    cell.everydayBook = self.everydayBook;

    
    
//    QLMRankingDataTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"QLMRankingDataTableViewCell" forIndexPath:indexPath];
//    //传递数据
//    cell.rankingDataArray = self.rankingDataArray;

    
    
    
    //取消选中效果
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
    
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
