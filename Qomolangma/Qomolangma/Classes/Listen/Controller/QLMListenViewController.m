//
//  QLMListenViewController.m
//  Qomolangma
//
//  Created by NowOrNever on 15/03/2017.
//  Copyright © 2017 Focus. All rights reserved.
//

#import "QLMListenViewController.h"
#import "QLMPlayListViewController.h"
#import "QLMCircleButton.h"
#import "QLMLoginViewController.h"
#define baseTimeBtnTag 1314

@interface QLMListenViewController ()

/**
 tabbar上的播放
 */
@property (nonatomic, strong) UIView *listenView;
@property (nonatomic, strong) UILabel *currentAudioLabel;



/**
 login页面
 */
@property (nonatomic, strong) QLMLoginViewController *loginViewController;

@end



@implementation QLMListenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor greenColor];
    [self setupUI];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    QLMPlayListViewController *flagVc = [QLMPlayListViewController sharedPlayListViewController];
    BOOL hiddenFlag = flagVc.navButtonStatusHidden;
    self.listenView.hidden = hiddenFlag;
    if (!hiddenFlag) {
//        self.currentAudioLabel.text =[NSString stringWithFormat:@"上次播放:%@",@"hello"];
        self.currentAudioLabel.text = [NSString stringWithFormat:@"上次播放:%@",flagVc.urlStringArray[arc4random_uniform((int)flagVc.urlStringArray.count)]];
    }
}

#pragma mark 界面搭建
- (void)setupUI{
    //navigationItem
    self.navigationItem.rightBarButtonItem = nil;
    
    
    
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
    CGFloat margin = 6.0;
    [self.view addSubview:self.listenView];
    [self.listenView addSubview:self.playingBtn];
    [self.listenView addSubview:self.currentAudioLabel];
    UIButton *lastAudioRightArrow = [UIButton fcs_buttonWithImageName:@"new_main_subscribe_right_44x44_"];
    [lastAudioRightArrow addTarget:self action:@selector(nextToPlayListViewControllerButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.listenView addSubview:lastAudioRightArrow];
    
    self.playingBtn.center = CGPointMake(self.listenView.bounds.size.height * 0.5, self.listenView.bounds.size.height * 0.5);
    [self.playingBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.listenView);
        make.left.equalTo(self.listenView).offset(0);
    }];
    
    [lastAudioRightArrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.listenView);
        make.right.equalTo(self.listenView).offset(-margin);
    }];
    [self.listenView layoutIfNeeded];
    
    [self.currentAudioLabel sizeToFit];
    [self.currentAudioLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.listenView).offset(1);
//        make.top.bottom.equalTo(self.listenView);
        make.width.lessThanOrEqualTo(@(kScreenWidth * 0.8));
        make.left.equalTo(self.playingBtn.mas_right).offset(0);
//        make.right.equalTo(lastAudioRightArrow).offset(-margin * 2);
    }];
    
    
    [self.view layoutIfNeeded];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    [self.listenView addGestureRecognizer:tap];
    
//    UIView *separeteLine = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, .7)];
//    separeteLine.backgroundColor = [UIColor colorWithWhite:.5 alpha:.6];
//    [self.view addSubview:separeteLine];
//    [separeteLine mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(self.listenView.mas_top).offset(0.1);
//    }];
    
    
    
    
    CGFloat timeBtnWidth = kScreenWidth * 0.2;
    
    UIView *timesButtonView = [[UIView alloc]initWithFrame:CGRectZero];
    [self.view addSubview:timesButtonView];
    [timesButtonView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(kScreenWidth * 0.8);
        make.height.mas_equalTo(timeBtnWidth);
        make.centerX.equalTo(self.view.mas_centerX);
        make.bottom.mas_equalTo(self.listenView.mas_top).offset(-margin * 2);
    }];
    
    NSArray<NSNumber *> *times = @[@15,@60,@120];
    NSMutableArray<UIButton *> *timesBtnArray = [NSMutableArray array];
    for (int i = 0; i < times.count; i++) {
        UIButton *btn = [QLMCircleButton fcs_buttonWithImageName:[NSString stringWithFormat:@"dailyAudio%zd_120x120_",[times[i] intValue]]];
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
    UIButton *halfAnHourBtn = [QLMCircleButton fcs_buttonWithImageName:@"dailyAudio30_170x170_"];
    [self.view addSubview:halfAnHourBtn];
    halfAnHourBtn.tag = baseTimeBtnTag + 30;
    [halfAnHourBtn addTarget:self action:@selector(timeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [halfAnHourBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(timesButtonView.mas_top).offset(-0.2 * halfAnHourBtnHeight);
        make.height.width.mas_equalTo(halfAnHourBtnHeight);
    }];
    
    
//    static int flag = 1;
    if (![QLMMineInfo sharedMineInfo].isLogin) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    //        vc.view.backgroundColor = vc.view.backgroundColor;
//            flag = 0;
            NSLog(@"abac*********");
            
            [self presentViewController:self.loginViewController animated:YES completion:nil];
    //        [[[UIApplication sharedApplication].windows firstObject].rootViewController presentViewController:[[QLMLoginViewController alloc]init] animated:YES completion:nil];
        });
    }
//
//    UIButton *testLoginButton = [UIButton buttonWithType:UIButtonTypeContactAdd];
//    [self.view addSubview:testLoginButton];
//    [testLoginButton addTarget:self action:@selector(testButtonClick) forControlEvents:UIControlEventTouchUpInside];
//    testLoginButton.center = self.view.center;
    
}

- (void)testButtonClick{
    [self presentViewController:[[QLMLoginViewController alloc]init] animated:YES completion:nil];
}


/**
 点击时间按钮触发生播放列表

 @param sender 按钮
 */
- (void)timeBtnClick:(UIButton *)sender{
    long time = sender.tag - baseTimeBtnTag;
//    NSLog(@"%zd",time);
    [QLMPlayListViewController sharedPlayListViewController].isVideo = !(time - 30);
    [self.navigationController pushViewController:[QLMPlayListViewController sharedPlayListViewController] animated:YES];
}

- (void)tapAction:(UITapGestureRecognizer *)sender{
    [self.navigationController pushViewController:[QLMPlayListViewController sharedPlayListViewController] animated:YES];
}

- (void)nextToPlayListViewControllerButtonClick:(UIButton *)sender{
    [self.navigationController pushViewController:[QLMPlayListViewController sharedPlayListViewController] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIView *)listenView{
    if (!_listenView) {
        _listenView = [[UIView alloc] initWithFrame:CGRectMake(0, kScreenHeight - kTabBarHeight * 2, kScreenWidth, kTabBarHeight)];
        _listenView.backgroundColor = [UIColor colorWithWhite:0.98 alpha:1];
    }
    return _listenView;
}

- (UILabel *)currentAudioLabel{
    if (!_currentAudioLabel) {
        _currentAudioLabel = [UILabel fcs_labelWithColor:[UIColor colorWithWhite:.4 alpha:1] andFontSize:15 andText:@"The length of initial version must be enough"];
    }
    return _currentAudioLabel;
}
//
- (QLMLoginViewController *)loginViewController{
    if (!_loginViewController) {
        _loginViewController = [[QLMLoginViewController alloc]init];
    }
    return _loginViewController;
}

@end
