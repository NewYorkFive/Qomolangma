//
//  QLMPlayListDetailTableViewController.m
//  Qomolangma
//
//  Created by NowOrNever on 18/03/2017.
//  Copyright © 2017 Focus. All rights reserved.
//

#import "QLMPlayListDetailTableViewController.h"
#import "QLMAudioModel.h"
#import "QLMPlayListDetailTableViewControllerTableViewCell.h"
#import "QLMPlayListViewController.h"
@interface QLMPlayListDetailTableViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray<QLMAudioModel *> *audiosModelArray;
@property (nonatomic, strong) UITableView *tableView;
@end

static NSString *cellID = @"QLMPlayListDetailTableViewControllerTableViewCell";

@implementation QLMPlayListDetailTableViewController

- (void)loadView{
    [super loadView];
    self.navigationController.navigationBar.clipsToBounds = NO;
    self.navigationController.navigationBar.translucent = NO;
    CGRect rect = CGRectMake(0, 0, kScreenWidth, kNavBarHeight);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    
}



- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.navigationItem.title = @"PlayList";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"下载全部" style:UIBarButtonItemStylePlain target:self action:@selector(downloadAllClick:)];
    [self.tableView registerClass:[QLMPlayListDetailTableViewControllerTableViewCell class] forCellReuseIdentifier:cellID];
    self.tableView.rowHeight = 80;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.showsHorizontalScrollIndicator = NO;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)loadData{
    [[QLMNetworkTools sharedTools] requestWithType:GET andUrlStr:@"app/resource/getAnyTimeListenResList" andParams:nil andSuccess:^(id responseObject) {
        NSLog(@"%@",[responseObject class]);
        NSDictionary *dic = responseObject;
        NSArray *array = dic[@"data"];
        for (int i = 0; i < array.count; i++) {
            [self.audiosModelArray addObject: [QLMAudioModel yy_modelWithDictionary:array[i]]];
        }
        [self.tableView reloadData];
        NSLog(@"%@",self.audiosModelArray.description);
    } andFailture:^(NSError *error) {
        NSLog(@"Sorry");
    }];
}

- (void)downloadAllClick:(UIButton *)sender{
    NSLog(@"Click download all");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //#warning Incomplete implementation, return the number of rows
    return self.audiosModelArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    QLMPlayListDetailTableViewControllerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.model = self.audiosModelArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    QLMPlayListViewController *toVc = [QLMPlayListViewController sharedPlayListViewController];
    QLMAudioModel *model = self.audiosModelArray[indexPath.row];
    toVc.topViewCurrentAudioTitleLabel.text = [NSString stringWithFormat:@"%@...",[model.resource_name substringToIndex:8]];
    toVc.topViewCurrentAudioDescriptionLabel.text = [NSString stringWithFormat:@"%@...",[model.resource_content substringToIndex:8]];
    [QLMPlayListViewController sharedPlayListViewController].playFlag = NO;
    [QLMPlayListViewController sharedPlayListViewController].audioUrlString = model.audio_file_url;
    [QLMPlayListViewController sharedPlayListViewController].isVideo = NO;
    [self.navigationController popViewControllerAnimated:YES];
    NSLog(@"abc");
}

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

- (NSMutableArray<QLMAudioModel *> *)audiosModelArray{
    if (!_audiosModelArray) {
        _audiosModelArray = [NSMutableArray array];
        //        for ( int i = 0; i < 20; i++) {
        //            [_audiosModelArray addObject:[QLMAudioModel randomAudio]];
        //        }
    }
    return _audiosModelArray;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStylePlain];
    }
    return _tableView;
}
@end
