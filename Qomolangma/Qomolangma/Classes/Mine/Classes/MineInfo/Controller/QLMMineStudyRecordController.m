//
//  QLMMineStudyRecordController.m
//  Qomolangma
//
//  Created by Aioria on 2017/3/17.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMMineStudyRecordController.h"
#import "QLMMineStudyRecordHeaderView.h"
@interface QLMMineStudyRecordController ()

@end

@implementation QLMMineStudyRecordController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];

}

- (void)setupUI
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    
    [self.view addSubview:tableView];
    
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.offset(0);
//        make.top.equalTo(self.mas_topLayoutGuide).offset(20);
        make.top.offset(0);
    }];
    
    QLMMineStudyRecordHeaderView *headerView = [[QLMMineStudyRecordHeaderView alloc] initWithFrame:CGRectMake(0, 0, 0, 170)];
    
    headerView.backgroundColor = [UIColor whiteColor];
    
    tableView.tableHeaderView = headerView;
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
