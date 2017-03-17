//
//  QLMPurchasedContentController.m
//  Qomolangma
//
//  Created by 王惠平 on 2017/3/17.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMPurchasedContentController.h"
#import "QLMPurchasedTableViewCell.h"
#import "LDRefresh.h"

@interface QLMPurchasedContentController ()



@end

@implementation QLMPurchasedContentController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTableView];
    
    [self addRefreshView];
  
}

- (void)addRefreshView {
    
    __weak __typeof(self) weakSelf = self;
    //下拉刷新
    self.tableView.refreshHeader = [self.tableView addRefreshHeaderWithHandler:^ {
        [weakSelf requestData];
    }];
    
}

#pragma mark - 下拉刷新数据
- (void)requestData{
    
    __weak QLMPurchasedContentController *weakSelf = self;
    
    //[MovieHttpTool getHotMovieWithStart:0 arrayBlock:^(NSMutableArray *resultArray) {
        //_resultArray = resultArray;
        
        [weakSelf.tableView.refreshHeader endRefresh];
        [self.tableView reloadData];
        
    //}];
}

- (void)setupTableView {
    
    [self.tableView registerNib:[UINib nibWithNibName:@"PurchasedContentCell" bundle:nil] forCellReuseIdentifier:@"cellid"];
    
    self.tableView.rowHeight = 180;
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    //预估行高
    self.tableView.estimatedRowHeight = 200;
    
    //取消分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

   

    
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    QLMPurchasedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellid" forIndexPath:indexPath];
    
   

    
    return cell;
}


//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    
//    return 180;
//}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
