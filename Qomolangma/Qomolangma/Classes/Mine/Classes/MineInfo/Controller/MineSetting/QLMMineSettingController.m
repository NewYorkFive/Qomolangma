//
//  QLMMineSettingController.m
//  Qomolangma
//
//  Created by Aioria on 2017/3/17.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMMineSettingController.h"
#import "QLMMineSettingBottomCell.h"
#import "QLMMineConfirmExitController.h"
#import "QLMMineAboutDeveloperController.h"

@interface QLMMineSettingController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray<NSArray<NSString *> *> *titlesArray;

@end

static NSString * const reuseID = @"reuseID";
static NSString * const bottomReuseID = @"bottomReuseID";

@implementation QLMMineSettingController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self setupUI];
}

- (void)setupUI
{
    
    if ([QLMMineInfo sharedMineInfo].isLogin)
    {
        self.titlesArray = @[@[@"推送消息设置"], @[@"使用听筒播放音频", @"WiFi时自动下载音频"], @[@"推荐好友", @"给软件打分", @"帮助中心"], @[@"清除缓存"], @[@"关于我们"], @[@""]];
    }
    else
    {
        self.titlesArray = @[@[@"推送消息设置"], @[@"使用听筒播放音频", @"WiFi时自动下载音频"], @[@"推荐好友", @"给软件打分", @"帮助中心"], @[@"清除缓存"], @[@"关于我们"]];
    }
    

    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    
    [self.view addSubview:tableView];
    
    tableView.dataSource = self;
    
    tableView.delegate = self;
    
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
    
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:reuseID];
    [tableView registerClass:[QLMMineSettingBottomCell class] forCellReuseIdentifier:bottomReuseID];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

        return self.titlesArray.count;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
        return self.titlesArray[section].count;

    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([QLMMineInfo sharedMineInfo].isLogin && indexPath.section == 5)
    {
        QLMMineSettingBottomCell *cell = [tableView dequeueReusableCellWithIdentifier:bottomReuseID forIndexPath:indexPath];
        
        return cell;
    }
    else
    {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID forIndexPath:indexPath];
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        cell.textLabel.text = self.titlesArray[indexPath.section][indexPath.row];
        
        return cell;
    }
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    if ([QLMMineInfo sharedMineInfo].isLogin && indexPath.section == 5)
    {
        QLMMineConfirmExitController *confirmExitController = [[QLMMineConfirmExitController alloc] init];
        
        [self presentViewController:confirmExitController animated:YES completion:nil];
    }
    else if (indexPath.section == 4)
    {
        QLMMineAboutDeveloperController *developerVC = [[QLMMineAboutDeveloperController alloc] init];
        
        developerVC.title = @"关于我们";
        
        [self.navigationController pushViewController:developerVC animated:YES];
    }

}

- (void) creatFooterView
{

   
    
}

@end
