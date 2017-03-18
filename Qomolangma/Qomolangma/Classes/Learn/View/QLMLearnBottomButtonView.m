//
//  QLMLearnBottomButtonView.m
//  Qomolangma
//
//  Created by 刘康 on 2017/3/18.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMLearnBottomButtonView.h"


@implementation QLMLearnBottomButtonView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupUI];
}

- (void)setupUI {
    self.multipleTouchEnabled = YES;
    //在底部View上添加按钮
    UIButton *testReadBtn = [[UIButton alloc] init];
    UIButton *payedBtn = [[UIButton alloc] init];
    [testReadBtn setTitle:@"试读" forState:UIControlStateNormal];
    [payedBtn setTitle:@"订阅 ¥39/月" forState:UIControlStateNormal];
    payedBtn.backgroundColor = [UIColor brownColor];
    testReadBtn.backgroundColor = [UIColor redColor];
    testReadBtn.enabled = YES;
    payedBtn.enabled = YES;
    [self addSubview:testReadBtn];
    [self addSubview:payedBtn];
    
    [testReadBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self).offset(4);
        make.bottom.equalTo(self.mas_bottom).offset(-4);
        make.right.equalTo(payedBtn.mas_left).offset(-8);
        make.width.offset([UIScreen mainScreen].bounds.size.width *.5 - 8);
    }];
    [payedBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.right.equalTo(self).offset(-4);
        make.top.equalTo(self).offset(4);
    }];
    
    //testReadBtn监听事件
    [testReadBtn addTarget:self action:@selector(clickTestReadBtn) forControlEvents:UIControlEventTouchUpInside];
    [payedBtn addTarget:self action:@selector(clickPayedBtn) forControlEvents:UIControlEventTouchUpInside];
    
    
    

}

-(void)clickTestReadBtn {
    QLMTestReadTableViewController *testReadVc = [QLMTestReadTableViewController new];
    [_testReadDelegate learnBottomButtonView:self withTestReadTableViewController:testReadVc];
}

-(void)clickPayedBtn {
    QLMLearnModelViewController *presntView = [QLMLearnModelViewController new];
    [_testReadDelegate learnBottomButtonView:self withPresntViewController:presntView];
}




@end
