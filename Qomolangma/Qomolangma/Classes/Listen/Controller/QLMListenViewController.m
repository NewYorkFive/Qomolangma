//
//  QLMListenViewController.m
//  Qomolangma
//
//  Created by NowOrNever on 15/03/2017.
//  Copyright © 2017 Focus. All rights reserved.
//

#import "QLMListenViewController.h"

#define baseTimeBtnTag 1314

@interface QLMListenViewController ()

/**
 tabbar上的播放
 */
@property (nonatomic, strong) UIView *listenView;
@end

@implementation QLMListenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor greenColor];
    [self setupUI];
}


#pragma mark 界面搭建
- (void)setupUI{
    
    //上面的界面
    UILabel *body = [UILabel fcs_labelWithColor:[UIColor blackColor] andFontSize:25 andText:@"现在，你想听多长时间？"];
    [self.view addSubview:body];
    [body mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(self.view).offset(44 + kNavBarHeight);
    }];
    
    UILabel *tips = [UILabel fcs_labelWithColor:[UIColor  colorWithWhite:.4 alpha:1] andFontSize:15 andText:@"点选时间，接下来让得到为你服务"];
    [self.view addSubview:tips];
    [tips mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(body.mas_bottom).offset(20);
    }];
    
    //下面的界面
    [self.view addSubview:self.listenView];
    
    CGFloat timeBtnWidth = kScreenWidth * 0.25;
    
    UIView *timesButtonView = [[UIView alloc]initWithFrame:CGRectZero];
    [self.view addSubview:timesButtonView];
    [timesButtonView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(kScreenWidth * 0.8);
        make.height.mas_equalTo(timeBtnWidth);
        make.centerX.equalTo(self.view.mas_centerX);
        make.bottom.mas_equalTo(self.listenView.mas_top);
    }];
    
    NSArray<NSNumber *> *times = @[@15,@60,@120];
    NSMutableArray<UIButton *> *timesBtnArray = [NSMutableArray array];
    for (int i = 0; i < times.count; i++) {
        UIButton *btn = [UIButton fcs_buttonWithImageName:[NSString stringWithFormat:@"dailyAudio%zd_120x120_",[times[i] intValue]]];
        [btn addTarget:self action:@selector(timeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = baseTimeBtnTag + [times[i] intValue];
//        btn.layer.cornerRadius = timeBtnWidth * 0.5;
        [timesBtnArray addObject:btn];
        [timesButtonView addSubview:btn];
    }
    
    [timesBtnArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedItemLength:timeBtnWidth leadSpacing:0 tailSpacing:0];
    [timesBtnArray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(timesButtonView);
    }];
    
    

    
    

    
    
    
    CGFloat halfAnHourBtnHeight = kScreenWidth * 0.3;
    
    UIButton *halfAnHourBtn = [UIButton fcs_buttonWithImageName:@"dailyAudio30_170x170_"];
//    UIButton *halfAnHourBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:halfAnHourBtn];
//    halfAnHourBtn.bounds = CGRectMake(0, 0, halfAnHourBtnHeight, halfAnHourBtnHeight);
//    [halfAnHourBtn setBackgroundImage:[UIImage imageNamed:@"dailyAudio30_170x170_"] forState:UIControlStateNormal];
   
//    [halfAnHourBtn setBackgroundImage:[UIImage imageNamed:@"dailyAudio30_170x170_"] forState:UIControlStateNormal];
//    halfAnHourBtn.imageView.contentMode = UIViewContentModeScaleAspectFill
//    [halfAnHourBtn sizeToFit];
//    halfAnHourBtn.layer.cornerRadius = halfAnHourBtn.bounds.size.width * 0.5;
//    halfAnHourBtn.layer.masksToBounds = YES;
//    halfAnHourBtn.layer.borderColor = [UIColor yellowColor].CGColor;
//    halfAnHourBtn.layer.borderWidth = 1;
//    halfAnHourBtn.clipsToBounds = YES;
//    halfAnHourBtn.center = CGPointMake(kScreenWidth * 0.5, kScreenHeight - kTabBarHeight * 2 - timeBtnWidth - halfAnHourBtnHeight * 0.5);
    
    halfAnHourBtn.tag = baseTimeBtnTag + 30;
    [halfAnHourBtn addTarget:self action:@selector(timeBtnClick:) forControlEvents:UIControlEventTouchUpInside];

    
    [halfAnHourBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.mas_equalTo(halfAnHourBtnHeight);
        make.centerX.equalTo(self.view.mas_centerX);
        make.bottom.equalTo(timesButtonView.mas_top);
//        make.height.width.mas_equalTo(halfAnHourBtnHeight);
    }];
    
}





/**
 点击时间按钮触发生播放列表

 @param sender 按钮
 */
- (void)timeBtnClick:(UIButton *)sender{
    long time = sender.tag - baseTimeBtnTag;
    NSLog(@"%zd",time);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *)listenView{
    if (!_listenView) {
        _listenView = [[UIView alloc] initWithFrame:CGRectMake(0, kScreenHeight - kTabBarHeight * 2, kScreenWidth, kTabBarHeight)];
//        _listenView.hidden = YES;
        _listenView.backgroundColor = [UIColor colorWithRed: 1 / 255.0 green: 150 / 255.0 blue: 1  alpha: 1];
    }
    return _listenView;
}

@end
