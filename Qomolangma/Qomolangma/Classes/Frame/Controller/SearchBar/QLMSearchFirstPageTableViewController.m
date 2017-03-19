//
//  QLMSearchFirstPageTableViewController.m
//  Qomolangma
//
//  Created by NowOrNever on 19/03/2017.
//  Copyright © 2017 Focus. All rights reserved.
//

#import "QLMSearchFirstPageTableViewController.h"
#import "QLMSearchSecondPageTableViewController.h"
@interface QLMSearchFirstPageTableViewController ()<UISearchResultsUpdating>
@property (nonatomic, strong) UISearchController *searchController;
@end

@implementation QLMSearchFirstPageTableViewController

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)setupUI{
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    QLMSearchSecondPageTableViewController *vc = [[QLMSearchSecondPageTableViewController alloc]init];
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:vc];
    // Use the current view controller to update the search results.
    self.searchController.searchResultsUpdater = self;
    // Install the search bar as the table header.
    self.navigationItem.titleView = self.searchController.searchBar;
    // It is usually good to set the presentation context.
    vc.navigationItem.titleView = self.searchController.searchBar;
    
    self.definesPresentationContext = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
