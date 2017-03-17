//
//  QLMPayedView.m
//  Qomolangma
//
//  Created by 刘康 on 2017/3/16.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMPayedView.h"
#import "QLMLearnTableViewCell.h"

@interface QLMPayedView ()<UITableViewDataSource>

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
@end
