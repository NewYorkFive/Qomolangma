//
//  QLMMineViewController.m
//  Qomolangma
//
//  Created by NowOrNever on 15/03/2017.
//  Copyright © 2017 Focus. All rights reserved.
//

#import "QLMMineViewController.h"
#import "QLMMineInfoModel.h"
#import "QLMMineInfoCell.h"
#import "QLMMineTopCell.h"
#import "QLMMineTableViewHeaderFooterView.h"
#import "QLMMineHeaderView.h"
#import "QLMMineLoginSelectController.h"

#define BACK_GROUND_IMAGE_VIEW_HEIGHT 245

@interface QLMMineViewController () <UITableViewDelegate, UITableViewDataSource>


@property (nonatomic, strong) UITableView *tableView;

/**
 模型数组
 */
@property (nonatomic, strong) NSArray<NSArray<QLMMineInfoModel *> *> *dataArray;


/**
 背景图片
 */
@property (nonatomic, strong) UIImageView *imgBackground;

@end

static NSString * const reuseID = @"reuseID";

static NSString * const topReuseID = @"topReuseID";

static NSString * const headerFooterReuseID = @"headerFooterReuseID";

@implementation QLMMineViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self loadMinInfoData];
    
    [self setupUI];
    
    
}

- (void) loadMinInfoData
{
    NSArray *tempArray = [NSArray arrayWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"MineInformatiom.plist" withExtension:nil]];
    
    NSMutableArray *dataArray = [NSMutableArray array];
    
    for (NSArray *array in tempArray)
    {
        NSMutableArray *modelsArray = [NSMutableArray array];
        
        for (NSDictionary *dict in array)
        {
            [modelsArray addObject:[QLMMineInfoModel mineInfoModelWithDict:dict]];
        }
        
        [dataArray addObject:modelsArray.copy];
    }

    self.dataArray = dataArray.copy;
}

- (void)setupUI
{
    self.navigationController.navigationBar.hidden = YES;

    self.imgBackground = [[UIImageView alloc] init];
    
    self.imgBackground.image = [UIImage imageNamed:@"userinfo_top_bg"];
    
    self.imgBackground.contentMode = UIViewContentModeScaleAspectFill;
    
    [self.view addSubview:self.imgBackground];
    
    [self.imgBackground mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.offset(0);
        make.height.offset(BACK_GROUND_IMAGE_VIEW_HEIGHT);
    }];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    QLMMineHeaderView *headerView = [[QLMMineHeaderView alloc] initWithFrame:CGRectMake(0, 0, 0, 200)];
    
    __weak typeof(self) weakSelf = self;
    
    [headerView setModalBlock:^{
        QLMMineLoginSelectController *loginSelectController = [[QLMMineLoginSelectController alloc] init];
        
        UINavigationController *navC = [[UINavigationController alloc] initWithRootViewController:loginSelectController];
        
        [weakSelf presentViewController:navC animated:YES completion:nil];
        
    }];
    
    self.tableView.tableHeaderView = headerView;
    
    [self.tableView registerClass:[QLMMineInfoCell class] forCellReuseIdentifier:reuseID];
    
    [self.tableView registerClass:[QLMMineTopCell class] forCellReuseIdentifier:topReuseID];
    
    [self.tableView registerClass:[QLMMineTableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:headerFooterReuseID];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return  self.dataArray.count + 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (section == 0)
    {
        return 1;
    }
    
    return self.dataArray[section - 1].count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        QLMMineTopCell *cell = [tableView dequeueReusableCellWithIdentifier:topReuseID forIndexPath:indexPath];
        return cell;
    }
    
    QLMMineInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID forIndexPath:indexPath];
    
    cell.mineInfoModel = self.dataArray[indexPath.section - 1][indexPath.row];
    
    return cell;
}

- (UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        
        _tableView.separatorColor = [UIColor colorWithWhite:.9 alpha:1];
        
        _tableView.backgroundColor = [UIColor clearColor];
        
        [self.view addSubview:_tableView];
        
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_topLayoutGuide);
            make.left.right.offset(0);
            make.bottom.equalTo(self.mas_bottomLayoutGuide).offset(10);
        }];
    }
    return _tableView;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UITableViewHeaderFooterView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerFooterReuseID];
    
    headerView.contentView.backgroundColor = [UIColor whiteColor];
    
    return headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return .01;
}

- (UITableViewHeaderFooterView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UITableViewHeaderFooterView *footerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:headerFooterReuseID];
    
    footerView.contentView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    return footerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return 50;
    }
    else
    {
        return 44;
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offsetY = self.tableView.contentOffset.y;
    
    if (offsetY < -80)
    {
        [self.imgBackground mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.offset(BACK_GROUND_IMAGE_VIEW_HEIGHT - (offsetY - 80) * .5);
        }];
    }
}

@end
