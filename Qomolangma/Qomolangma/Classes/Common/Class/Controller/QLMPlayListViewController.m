//
//  QLMPlayListViewController.m
//  Qomolangma
//
//  Created by NowOrNever on 16/03/2017.
//  Copyright © 2017 Focus. All rights reserved.
//

#import "QLMPlayListViewController.h"
#import "QLMRectButton.h"
#import "QLMCircleButton.h"

@interface QLMPlayListViewController ()
@property (nonatomic, assign) BOOL flag;
@property (nonatomic, strong) UILabel *navTitleLabel;

@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) UIView *topViewCurrentAudioTitleLabel;
@property (nonatomic, strong) UIView *topViewCurrentAudioDescriptionLabel;
@property (nonatomic, strong) UIImageView *topViewCurrentAudioImageView;

@property (nonatomic, strong) UIView *middleView;
@property (nonatomic, strong) UIView *bottomView;

@end

@implementation QLMPlayListViewController



+ (instancetype)sharedPlayListViewController{
    static QLMPlayListViewController *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[QLMPlayListViewController alloc]init];
        instance.playFlag = NO;
        instance.hidesBottomBarWhenPushed = YES;
    });
    return instance;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setupNavBar];
}
- (void)setupNavBar{
    //背景
    self.navigationController.navigationBar.translucent = YES;
    CGRect rect = CGRectMake(0, 0, kScreenWidth, kNavBarHeight);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.clipsToBounds = YES;
    
    [self.navTitleLabel sizeToFit];
    self.navigationItem.titleView = self.navTitleLabel;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"PlayList" style:UIBarButtonItemStylePlain target:self action:@selector(playlistButtonClick)];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}


#pragma mark 1.setupUI
- (void)setupUI{
    
    self.view.backgroundColor = [UIColor colorWithWhite:.8 alpha:1];
    
    CGFloat ratio1 = 0.564;
    UILabel *separeteLine1 = [[UILabel alloc]initWithFrame:CGRectMake(0, kScreenHeight * ratio1, kScreenWidth, 1)];
    separeteLine1.backgroundColor = [UIColor colorWithRed: 1 / 255.0 green: 150 / 255.0 blue: 1  alpha: 1];
    [self.view addSubview:separeteLine1];
    
    CGFloat ratio2 = 0.893;
    UILabel *separeteLine2 = [[UILabel alloc]initWithFrame:CGRectMake(0, kScreenHeight * ratio2, kScreenWidth, 1)];
    separeteLine2.backgroundColor = [UIColor colorWithRed: 1 / 255.0 green: 150 / 255.0 blue: 1  alpha: 1];
    [self.view addSubview:separeteLine2];
    
    [self.view addSubview:self.topView];
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_offset(kNavBarHeight);
        make.bottom.equalTo(separeteLine1.mas_top);
        make.left.right.equalTo(self.view);
    }];
    [self setupTopView];
    
    
    [self.view addSubview:self.middleView];
    self.middleView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.middleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(separeteLine1.mas_bottom);
        make.bottom.equalTo(separeteLine2.mas_top).offset(0);
        make.left.right.equalTo(self.view);
    }];
    [self setupMiddleView];
    
    [self.view addSubview:self.bottomView];
    self.bottomView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(separeteLine2.mas_bottom);
        make.left.bottom.right.equalTo(self.view);
    }];
    [self setupBottomView];
    
    
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
//    btn.center = self.view.center;
//    [self.view addSubview:btn];
//    [btn addTarget:self action:@selector(playButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
}

#pragma mark 1.1setupTopView
- (void)setupTopView{
    [self.view layoutIfNeeded];
    [self.topView addSubview:self.topViewCurrentAudioImageView];
    [self.topViewCurrentAudioImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(self.topView.bounds.size.width * 0.4);
        make.height.mas_equalTo(self.topView.bounds.size.height * 0.6);
        make.centerY.equalTo(self.topView).offset(-self.topView.bounds.size.height * 0.13);
        make.centerX.equalTo(self.topView);
    }];
    CGFloat margin = 10;
    NSLog(@"%@",NSStringFromCGRect(self.topViewCurrentAudioImageView.frame));
    [self.topView addSubview:self.topViewCurrentAudioTitleLabel];
    [self.topViewCurrentAudioTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topViewCurrentAudioImageView.mas_bottom).offset(margin * 2.5);
        make.centerX.equalTo(self.topView);
    }];
    
    [self.topView addSubview:self.topViewCurrentAudioDescriptionLabel];
    [self.topViewCurrentAudioDescriptionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topViewCurrentAudioTitleLabel.mas_bottom).offset(margin);
        make.centerX.equalTo(self.topView);
    }];
}
#pragma mark 1.2setupMiddleView
- (void)setupMiddleView{
    [self.view layoutIfNeeded];
    
    QLMCircleButton *playPauseButton = [QLMCircleButton fcs_buttonWithImageName:@"mediaplayer_play_btn_70x70_" selectedImageName:@"mediaplayer_parse_btn_70x70_"];
    [playPauseButton addTarget:self action:@selector(playButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.middleView addSubview:playPauseButton];
    playPauseButton.ratio = 0.45;

    CGFloat height = self.middleView.bounds.size.height * 0.4;
    
    [playPauseButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.mas_equalTo(height * 2);
        make.center.equalTo(self.middleView);
    }];
//    playPauseButton.backgroundColor = [UIColor purpleColor];
    
    CGFloat ratio = 0.8;
    CGFloat occupyRatio = 0.3;
    CGFloat margin = 16;
    UIView *leftView = [[UIView alloc] init];
    [self.middleView addSubview:leftView];
    [leftView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.middleView).offset(margin);
        make.right.equalTo(playPauseButton.mas_left).offset(playPauseButton.bounds.size.width * occupyRatio);
        make.height.mas_equalTo(playPauseButton.bounds.size.height * ratio);
        make.centerY.equalTo(playPauseButton);
    }];
//    leftView.backgroundColor = [UIColor blueColor];
    QLMRectButton *leftFifteenMinus = [QLMRectButton fcs_buttonWithImageName:@"mediaplayer_15second_left_44x44_"];
    leftFifteenMinus.ratio = 0.5;
    [leftView addSubview:leftFifteenMinus];
    QLMRectButton *leftAudio = [QLMRectButton fcs_buttonWithImageName:@"mediaplayer_last_btn_44x44_"];
    leftAudio.ratio = 0.5;
    [leftView addSubview:leftAudio];
    [leftView.subviews mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    [leftView.subviews mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(leftView);
    }];
    
    UIView *rightView = [[UIView alloc] init];
    [self.middleView addSubview:rightView];
    [rightView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.middleView).offset(-margin);
        make.left.equalTo(playPauseButton.mas_right).offset(playPauseButton.bounds.size.width * occupyRatio * -1);
        make.height.mas_equalTo(playPauseButton.bounds.size.height * ratio);
        make.centerY.equalTo(playPauseButton);
    }];
    
    QLMRectButton *rightAudio = [QLMRectButton fcs_buttonWithImageName:@"mediaplayer_next_btn_44x44_"];
    [rightView addSubview:rightAudio];
    rightAudio.ratio = 0.5;
    
    QLMRectButton *rightFifteenMinus = [QLMRectButton fcs_buttonWithImageName:@"mediaplayer_15second_right_44x44_"];
    [rightView addSubview:rightFifteenMinus];
    rightFifteenMinus.ratio = 0.5;
    
    [rightView.subviews mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    [rightView.subviews mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(rightView);
    }];
    
    
}
#pragma mark 1.3setupBottomView
- (void)setupBottomView{
    [self.view layoutIfNeeded];
    
    CGFloat marginRatio = 0.15;
    
    UIView *bodyView = [[UIView alloc]init];
//    bodyView.backgroundColor = [UIColor blueColor];
    [self.bottomView addSubview:bodyView];
    [bodyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.bottomView);
        make.top.equalTo(self.bottomView).offset(self.bottomView.bounds.size.height * marginRatio * 0.5);
        make.bottom.equalTo(self.bottomView).offset(-self.bottomView.bounds.size.height * marginRatio);
    }];
    [self.view layoutIfNeeded];
    
    
    CGFloat ratio = 0.77;
    
    NSMutableArray<UILabel *> *titleLabelArray = [NSMutableArray array];
    NSArray<NSString *> *buttonTitles = @[@"下载",@"文稿",@"796",@"分享",@"更多"];
    for (int i = 0; i < buttonTitles.count; i++) {
        UILabel *label = [UILabel fcs_labelWithColor:[UIColor colorWithWhite:.66 alpha:1] andFontSize:15 andText:buttonTitles[i]];
        label.textAlignment = NSTextAlignmentCenter;
        [bodyView addSubview:label];
        [titleLabelArray addObject:label];
    }
    [titleLabelArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:10 tailSpacing:10];
    [titleLabelArray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(bodyView.bounds.size.height * (1 - ratio));
        make.bottom.equalTo(bodyView);
    }];
    
    

    
    NSMutableArray<UIButton *> *buttonsArray = [NSMutableArray array];
    UIButton *downloadButton = [UIButton fcs_buttonWithImageName:@"mediaplayer_download_btn_44x44_" selectedImageName:@"mediaplayer_download_ok_btn_44x44_" highlightedImageName:nil disableImageName:nil];
    
    [bodyView addSubview:downloadButton];
    [buttonsArray addObject:downloadButton];
    
    UIButton *documentButton = [UIButton fcs_buttonWithImageName:@"mediaplayer_text_btn_44x44_" selectedImageName:nil highlightedImageName:nil disableImageName:@"mediaplayer_text_disable_btn_44x44_"];
    [bodyView addSubview:documentButton];
    [buttonsArray addObject:documentButton];
    
    UIButton *likeButton = [UIButton fcs_buttonWithImageName:@"mediaplayer_like_btn_44x44_" selectedImageName:@"mediaplayer_like_btn_selected_44x44_" highlightedImageName:nil disableImageName:@"mediaplayer_like_disable_btn_44x44_"];
    [bodyView addSubview:likeButton];
    [buttonsArray addObject:likeButton];
    
    UIButton *shareButton = [UIButton fcs_buttonWithImageName:@"mediaplayer_share_btn_44x44_" selectedImageName:nil highlightedImageName:nil disableImageName:@"mediaplayer_share_disable_btn_44x44_"];
    [bodyView addSubview:shareButton];
    [buttonsArray addObject:shareButton];
    
    UIButton *moreButton = [UIButton fcs_buttonWithImageName:@"new_audio_more_btn_44x44_"];
    [bodyView addSubview:moreButton];
    [buttonsArray addObject:moreButton];
    
    [buttonsArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:10 tailSpacing:10];
    [buttonsArray mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bodyView);
        make.height.mas_equalTo(bodyView.bounds.size.height * ratio);
    }];
    
//    downloadButton.titleLabel.text = @"\n\nDownload";
//    downloadButton.titleLabel.numberOfLines = 0 ;
//    [downloadButton.titleLabel sizeToFit];
//    [downloadButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(downloadButton);
//    }];
//    [self.view layoutIfNeeded];
//    NSLog(@"download frame:%@",NSStringFromCGRect(downloadButton.titleLabel.frame));
    
//    UIButton *
    
//    [downloadButton mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.bottomView);
//    }];
//    self.bottomView.backgroundColor = [UIColor purpleColor];
    
    
    
}


- (void)playlistButtonClick{
    NSLog(@"Click playlist");
}




- (void)playButtonClick:(UIButton *)sender{
    sender.selected = !sender.selected;
    QLMVoiceModel *tempModel = [[QLMVoiceModel alloc]init];
    tempModel.name = @"Hello,Girls";
    [self.playListModelArray addObject:tempModel];
    
    self.playFlag = !self.playFlag;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"changePlayBtnStatus" object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UILabel *)navTitleLabel{
    if (!_navTitleLabel) {
        _navTitleLabel = [UILabel fcs_labelWithColor:[UIColor colorWithWhite:.66 alpha:1] andFontSize:14 andText:@"随时听1/5"];
    }
    return _navTitleLabel;
}


- (NSMutableArray<QLMVoiceModel *> *)playListModelArray{
    if (!_playListModelArray) {
        _playListModelArray = [NSMutableArray array];
    }
    return _playListModelArray;
}

- (UIView *)topView{
    if (!_topView) {
        _topView = [[UIView alloc]init];
    }
    return _topView;
}

- (UIView *)topViewCurrentAudioTitleLabel{
    if (!_topViewCurrentAudioTitleLabel) {
        _topViewCurrentAudioTitleLabel = [UILabel fcs_labelWithColor:[UIColor colorWithWhite:.95 alpha:1] andFontSize:24 andText:@"currentAudioTitle"];
    }
    return _topViewCurrentAudioTitleLabel;
}

- (UIView *)topViewCurrentAudioDescriptionLabel{
    if (!_topViewCurrentAudioDescriptionLabel) {
        _topViewCurrentAudioDescriptionLabel = [UILabel fcs_labelWithColor:[UIColor fcs_colorWithHex:0x666666] andFontSize:15 andText:@"currentAudioDescription"];
    }
    return _topViewCurrentAudioDescriptionLabel;
}

- (UIImageView *)topViewCurrentAudioImageView{
    if (!_topViewCurrentAudioImageView) {
        _topViewCurrentAudioImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"audio_today_"]];
    }
    return _topViewCurrentAudioImageView;
}

- (UIView *)middleView{
    if (!_middleView) {
        _middleView = [[UIView alloc]init];
    }
    return _middleView;
}

- (UIView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[UIView alloc]init];
    }
    return _bottomView;
}


@end
