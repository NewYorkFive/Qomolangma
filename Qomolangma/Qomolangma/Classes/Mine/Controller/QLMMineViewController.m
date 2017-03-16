//
//  QLMMineViewController.m
//  Qomolangma
//
//  Created by NowOrNever on 15/03/2017.
//  Copyright © 2017 Focus. All rights reserved.
//

#import "QLMMineViewController.h"
#import "QLMMineInfoModel.h"
#import <YYModel.h>
#import "QLMMineInfoCell.h"

@interface QLMMineViewController () <UITableViewDelegate, UITableViewDataSource>


@property (nonatomic, strong) UITableView *tableView;

/**
 模型数组
 */
@property (nonatomic, strong) NSArray<NSArray<QLMMineInfoModel *> *> *dataArray;

@property (nonatomic, strong) UIImageView *imgBackground;

@end

static NSString * const reuseID = @"reuseID";

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
    
    self.imgBackground.contentMode = UIViewContentModeScaleAspectFit;
    
    [self.view addSubview:self.imgBackground];
    
    [self.imgBackground mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.offset(0);
        make.height.offset(245);
    }];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.tableView registerClass:[QLMMineInfoCell class] forCellReuseIdentifier:reuseID];
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return  self.dataArray.count;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return self.dataArray[section].count;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QLMMineInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID forIndexPath:indexPath];
    
    cell.mineInfoModel = self.dataArray[indexPath.section][indexPath.row];
    
    return cell;
}

- (UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        
        _tableView.separatorColor = [UIColor colorWithWhite:.9 alpha:1];
        
        [self.view addSubview:_tableView];
        
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(200);
            make.left.right.offset(0);
            make.bottom.equalTo(self.mas_bottomLayoutGuide);
        }];
    }
    return _tableView;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return .1;
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
