//
//  QLMPayedView.m
//  Qomolangma
//
//  Created by 刘康 on 2017/3/16.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMPayedView.h"
#import "QLMLearnTableViewCell.h"
#import "MJRefresh.h"

@interface QLMPayedView ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) NSArray<QLMLearnFirstCellModel *> *firstCellModelArray;
@end

@implementation QLMPayedView

- (void)loadData{
    [[QLMNetworkTools sharedTools] requestWithType:GET andUrlStr:@"app/resource/getSubscribeList" andParams:nil andSuccess:^(id responseObject) {
        NSArray *array = ((NSDictionary *)responseObject)[@"data"];
        NSMutableArray<QLMLearnFirstCellModel *> *mArr = [NSMutableArray array];
        for (int i = 0; i < array.count; i++) {
            [mArr addObject:[QLMLearnFirstCellModel yy_modelWithDictionary:array[i]]];
        }
        self.firstCellModelArray = mArr.copy;
        [self reloadData];
    } andFailture:^(NSError *error) {
        NSLog(@"Error:%@",error);
    }];
}


- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    
    if (self) {
       [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.dataSource = self;
    self.delegate = self;
    [self registerClass:[QLMLearnTableViewCell class] forCellReuseIdentifier:@"learnTableCell"];
    
    [self loadData];
    //行高
    self.rowHeight = 110;
    //下拉刷新
    self.mj_header= [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.mj_header beginRefreshing];
        [self.mj_header endRefreshing];
    }];
}


- (NSInteger)numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.firstCellModelArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    QLMLearnTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"learnTableCell" forIndexPath:indexPath];
    cell.model = self.firstCellModelArray[indexPath.row];
//    self.model = cell.model;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0.0001;
    }else{
        return 10;
    }
}


//点击cell响应
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //让controller push控制器
    QLMLearnDetailsTableViewController *detailsTableViewVc = [[QLMLearnDetailsTableViewController alloc] init];
    detailsTableViewVc.model = self.firstCellModelArray[indexPath.row];
//    NSLog(@"%@",self.firstCellModelArray[indexPath.row]);
    self.block(detailsTableViewVc);
    
//    [_detailDelegate payedView:self withDetailsTableViewController:detailsTableViewVc withIndexPath:indexPath];
    
}
@end
