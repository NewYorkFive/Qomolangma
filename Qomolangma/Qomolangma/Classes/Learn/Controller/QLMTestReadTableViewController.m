//
//  QLMTestReadTableViewController.m
//  Qomolangma
//
//  Created by 刘康 on 2017/3/18.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMTestReadTableViewController.h"
#import "QLMTestReadTableViewCell.h"
#import "MJRefresh.h"


@interface QLMTestReadTableViewController ()
@property (nonatomic, strong) NSArray<QLMLearnFirstCellModel *> *firstCellModelArray;
@end

static NSString *testCell = @"testCell";
@implementation QLMTestReadTableViewController

- (void)loadData{
    [[QLMNetworkTools sharedTools] requestWithType:GET andUrlStr:@"app/resource/getSubscribeList" andParams:nil andSuccess:^(id responseObject) {
        NSArray *array = ((NSDictionary *)responseObject)[@"data"];
        NSMutableArray<QLMLearnFirstCellModel *> *mArr = [NSMutableArray array];
        for (int i = 0; i < array.count; i++) {
            [mArr addObject:[QLMLearnFirstCellModel yy_modelWithDictionary:array[i]]];
        }
        self.firstCellModelArray = mArr.copy;
        [self.tableView reloadData];
    } andFailture:^(NSError *error) {
        NSLog(@"Error:%@",error);
    }];
}

- (instancetype)init{
    if (self = [super init]) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[QLMTestReadTableViewCell class] forCellReuseIdentifier:testCell];
    [self setupUI];
}

- (void)setupUI {
    //去掉多余的分割线
    self.tableView.tableFooterView = [[UIView alloc] init];
    //预估行高
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 300;
    
    self.navigationController.navigationBar.alpha = 1;
    //Refreshing
    self.tableView.mj_header= [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.tableView.mj_header beginRefreshing];
        [self loadData];
        [self.tableView.mj_header endRefreshing];
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    QLMTestReadTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:testCell forIndexPath:indexPath];
    cell.model = self.model;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10;
}

@end
