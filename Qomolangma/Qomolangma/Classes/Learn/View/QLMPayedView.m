//
//  QLMPayedView.m
//  Qomolangma
//
//  Created by 刘康 on 2017/3/16.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMPayedView.h"
#import "QLMLearnTableViewCell.h"

@interface QLMPayedView ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation QLMPayedView

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
    
    //行高
    self.rowHeight = 120;
//    self.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    QLMLearnTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"learnTableCell" forIndexPath:indexPath];
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
    NSLog(@"我被点击了---%zd",indexPath);
    //让controller push控制器
    QLMLearnDetailsTableViewController *detailsTableViewVc = [[QLMLearnDetailsTableViewController alloc] init];
    
    [_detailDelegate payedView:self withDetailsTableViewController:detailsTableViewVc withIndexPath:indexPath];
}
@end
