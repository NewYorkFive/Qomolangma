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
#import "QLMPlayListDetailTableViewController.h"
#import <ZFPlayer.h>
@interface QLMPlayListViewController ()<ZFPlayerDelegate>


@property (nonatomic, assign) int urlIndex;

@property (nonatomic, assign) BOOL flag;
@property (nonatomic, strong) UILabel *navTitleLabel;

@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) ZFPlayerView *playerView;
//ZFPlayerControlView *controlView = [[ZFPlayerControlView alloc] init];
//// model
//ZFPlayerModel *playerModel = [[ZFPlayerModel alloc]init];


@property (nonatomic, strong) UIView *topViewCurrentAudioTitleLabel;
@property (nonatomic, strong) UIView *topViewCurrentAudioDescriptionLabel;
@property (nonatomic, strong) UIImageView *topViewCurrentAudioImageView;

@property (nonatomic, strong) UIView *middleView;
@property (nonatomic, strong) UIButton *playPauseButton;


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
        instance.navButtonStatusHidden = YES;
    });
    return instance;
}



- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self setupNavBar];
    if (self.isVideo) {
        self.playPauseButton.selected = YES;
        self.playFlag = NO;
        [self.playerView autoPlayTheVideo];
    }else{
        self.playPauseButton.selected = self.playFlag;
    }
    
    self.title = self.navTitleLabel.text;
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




- (void)setIsVideo:(BOOL)isVideo{
    _isVideo = isVideo;
    if (isVideo) {
        self.playerView.hidden = NO;
        
        [self.playerView resetPlayer];
        
        // control view（you can custom）
        ZFPlayerControlView *controlView = [[ZFPlayerControlView alloc] init];
        // model
        ZFPlayerModel *playerModel = [[ZFPlayerModel alloc]init];
        playerModel.fatherView = self.topView;
        self.urlIndex = arc4random_uniform((int)(self.urlStringArray.count - 1));
        playerModel.videoURL = [NSURL URLWithString:self.urlStringArray[self.urlIndex]];
        playerModel.title = @"Video Player";
        [self.playerView playerControlView:controlView playerModel:playerModel];
        
    }else{
//        [self.playerView pause];
        
        self.playerView.hidden = YES;
        [self.playerView resetPlayer];
        
        // control view（you can custom）
        ZFPlayerControlView *controlView = [[ZFPlayerControlView alloc] init];
        // model
        ZFPlayerModel *playerModel = [[ZFPlayerModel alloc]init];
        playerModel.fatherView = self.topView;
//        self.urlIndex = arc4random_uniform((int)(self.urlStringArray.count - 1));
        playerModel.videoURL = [NSURL URLWithString:self.audioUrlString];
        playerModel.title = @"Audio Player";
        [self.playerView playerControlView:controlView playerModel:playerModel];
        
        [self.playerView autoPlayTheVideo];
        [self.playerView pause];
        
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [self.playerView autoPlayTheVideo];
//        });

    }
}

# pragma mark 1.2.1联动逻辑实现
- (void)rightMediaClick{
    [self.playerView resetPlayer];
    
    // control view（you can custom）
    ZFPlayerControlView *controlView = [[ZFPlayerControlView alloc] init];
    // model
    ZFPlayerModel *playerModel = [[ZFPlayerModel alloc]init];
    playerModel.fatherView = self.topView;
    self.urlIndex = (self.urlIndex + 1) % self.urlStringArray.count;
    playerModel.videoURL = [NSURL URLWithString:self.urlStringArray[self.urlIndex]];
    playerModel.title = @"Video Player";
    [self.playerView playerControlView:controlView playerModel:playerModel];
    [self.playerView autoPlayTheVideo];



    
//    [self.playerView autoPlayTheVideo];
//    [self.playerView pause];
    
//    dispatch_after(<#dispatch_time_t when#>, <#dispatch_queue_t  _Nonnull queue#>, <#^(void)block#>)
    
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [self.playerView pause];
//    });
}

- (void)leftMediaClik{
    
    [self.playerView resetPlayer];
    
    // control view（you can custom）
    ZFPlayerControlView *controlView = [[ZFPlayerControlView alloc] init];
    // model
    ZFPlayerModel *playerModel = [[ZFPlayerModel alloc]init];
    playerModel.fatherView = self.topView;
    self.urlIndex = (self.urlIndex - 1) % self.urlStringArray.count;
    playerModel.videoURL = [NSURL URLWithString:self.urlStringArray[self.urlIndex]];
    playerModel.title = @"Video Player";
    [self.playerView playerControlView:controlView playerModel:playerModel];
    [self.playerView autoPlayTheVideo];
}


- (void)playButtonClick:(UIButton *)sender{
    
    sender.selected = !sender.selected;
    
    if (self.isVideo) {
        sender.selected = self.playerView.isPauseByUser;
        if (sender.selected) {
            [self.playerView play];
            return;
        }
        [self.playerView pause];
        return;
    }
    
    self.navButtonStatusHidden = NO;
    
    QLMAudioModel *tempModel = [[QLMAudioModel alloc]init];
    tempModel.title = @"Hello,Girls";
    [self.playListModelArray addObject:tempModel];
    
    self.playFlag = !self.playFlag;
    if (self.playFlag) {
        [self.playerView play];
    }else{
        [self.playerView pause];
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:@"changePlayBtnStatus" object:nil];
}

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    if (self.isVideo) {
        [self.playerView pause];
    }
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
    
    
    
    
    
    [self.topView addSubview:self.playerView];
    [self.playerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topView).offset(20);
        make.left.right.equalTo(self.topView);
        // Here a 16:9 aspect ratio, can customize the video aspect ratio
//        make.height.equalTo(self.playerView.mas_width).multipliedBy(9.0f/16.0f);
        
    }];

    
    // control view（you can custom）
    ZFPlayerControlView *controlView = [[ZFPlayerControlView alloc] init];
    // model
    ZFPlayerModel *playerModel = [[ZFPlayerModel alloc]init];
    playerModel.fatherView = self.topView;
    playerModel.videoURL = [NSURL URLWithString:@"http://wvideo.spriteapp.cn/video/2016/0328/56f8ec01d9bfe_wpd.mp4"];
    playerModel.title = @"Video Player";
    [self.playerView playerControlView:controlView playerModel:playerModel];
    // delegate
    self.playerView.delegate = self;
    // auto play the video

}
#pragma mark 1.2setupMiddleView
- (void)setupMiddleView{
    [self.view layoutIfNeeded];
    
    QLMCircleButton *playPauseButton = [QLMCircleButton fcs_buttonWithImageName:@"mediaplayer_play_btn_70x70_" selectedImageName:@"mediaplayer_parse_btn_70x70_"];
    self.playPauseButton = playPauseButton;
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
    QLMRectButton *leftMedia = [QLMRectButton fcs_buttonWithImageName:@"mediaplayer_last_btn_44x44_"];
    [leftMedia addTarget:self action:@selector(leftMediaClik) forControlEvents:UIControlEventTouchUpInside];
    leftMedia.ratio = 0.5;
    [leftView addSubview:leftMedia];
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
    
    QLMRectButton *rightMedia = [QLMRectButton fcs_buttonWithImageName:@"mediaplayer_next_btn_44x44_"];
    [rightMedia addTarget:self action:@selector(rightMediaClick) forControlEvents:UIControlEventTouchUpInside];
    [rightView addSubview:rightMedia];
    rightMedia.ratio = 0.5;
    
    QLMRectButton *rightFifteenMinus = [QLMRectButton fcs_buttonWithImageName:@"mediaplayer_15second_right_44x44_"];
    [rightView addSubview:rightFifteenMinus];
    rightFifteenMinus.ratio = 0.5;
    
    [rightView.subviews mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    [rightView.subviews mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(rightView);
    }];
    
    self.isVideo = self.isVideo;
    
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
    [self.navigationController pushViewController:[[QLMPlayListDetailTableViewController alloc]init] animated:YES];
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


- (NSMutableArray<QLMAudioModel *> *)playListModelArray{
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
        [UIColor purpleColor];
    }
    return _middleView;
}

- (UIView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[UIView alloc]init];
    }
    return _bottomView;
}

- (NSArray<NSString *> *)urlStringArray{
    if (!_urlStringArray) {
        _urlStringArray = @[@"http://7xqhmn.media1.z0.glb.clouddn.com/femorning-20161106.mp4",
                            @"http://wvideo.spriteapp.cn/video/2016/0328/56f8ec01d9bfe_wpd.mp4",
                            @"http://baobab.wdjcdn.com/1456117847747a_x264.mp4",
                            @"http://baobab.wdjcdn.com/14525705791193.mp4",
                            @"http://baobab.wdjcdn.com/1456459181808howtoloseweight_x264.mp4",
                            @"http://baobab.wdjcdn.com/1455968234865481297704.mp4",
                            @"http://baobab.wdjcdn.com/1455782903700jy.mp4",
                            @"http://baobab.wdjcdn.com/14564977406580.mp4",
                            @"http://baobab.wdjcdn.com/1456316686552The.mp4",
                            @"http://baobab.wdjcdn.com/1456480115661mtl.mp4",
                            @"http://baobab.wdjcdn.com/1456665467509qingshu.mp4",
                            @"http://baobab.wdjcdn.com/1455614108256t(2).mp4",
                            @"http://baobab.wdjcdn.com/1456317490140jiyiyuetai_x264.mp4",
                            @"http://baobab.wdjcdn.com/1455888619273255747085_x264.mp4",
                            @"http://baobab.wdjcdn.com/1456734464766B(13).mp4",
                            @"http://baobab.wdjcdn.com/1456653443902B.mp4",
                            @"http://baobab.wdjcdn.com/1456231710844S(24).mp4"];
    }
    return _urlStringArray;
}

- (void)zf_playerBackAction{
    [self.navigationController popViewControllerAnimated:YES];
}

- (ZFPlayerView *)playerView{
    if (!_playerView) {
        _playerView = [[ZFPlayerView alloc]init];
    }
    return _playerView;
}

@end
