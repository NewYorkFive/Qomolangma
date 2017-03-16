//
//  QLMLearnTableViewCell.m
//  Qomolangma
//
//  Created by 刘康 on 2017/3/16.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMLearnTableViewCell.h"

@implementation QLMLearnTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    [self setupUI];
    return [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
}

//自定义tableCell,添加数据
- (void)setupUI {
    self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
}

@end
