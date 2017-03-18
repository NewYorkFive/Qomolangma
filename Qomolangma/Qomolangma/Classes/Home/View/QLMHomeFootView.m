//
//  QLMHomeFootView.m
//  Qomolangma
//
//  Created by 张晨晖 on 2017/3/17.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMHomeFootView.h"

@interface QLMHomeFootView ()



@end

@implementation QLMHomeFootView

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]){
        [self setupUI];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self setupUI];
}

- (void)setupUI {
    self.backgroundColor = [UIColor grayColor];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
