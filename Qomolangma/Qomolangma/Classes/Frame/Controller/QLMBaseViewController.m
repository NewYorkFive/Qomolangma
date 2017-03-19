//
//  QLMBaseViewController.m
//  Qomolangma
//
//  Created by NowOrNever on 17/03/2017.
//  Copyright © 2017 Focus. All rights reserved.
//

#import "QLMBaseViewController.h"
#import "QLMPlayListViewController.h"
#import "QLMSearchFirstPageTableViewController.h"
@interface QLMBaseViewController ()
@property (nonatomic, strong) UIView *customBarItemView;
@end

@implementation QLMBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self baseSetupUI];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.clipsToBounds = NO;
}


- (void)baseSetupUI{
    [self setupNavigationBar];
}

- (void)setupNavigationBar{
    
    [self setupNavBar];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(infoNotificationPlayBtnClick:) name:@"changePlayBtnStatus" object:nil];
    
}



//navigationBar
- (void)setupNavBar{

    
    UIView *customBarItemView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 45, 35)];
    QLMPlayingButton *playingBtn = self.playingBtn;
    playingBtn.center = CGPointMake(customBarItemView.bounds.size.width * 0.5, customBarItemView.bounds.size.height * 0.5);
    [customBarItemView addSubview:playingBtn];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:customBarItemView];
    [playingBtn addTarget:self action:@selector(playingBtnClick) forControlEvents:UIControlEventTouchUpInside];
    self.customBarItemView = customBarItemView;
    self.customBarItemView.hidden = YES;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[[UIImage imageNamed:@"feed_navbar_search_44x44_"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(searchButtonClick)];
}

- (void)searchButtonClick{
    [self.navigationController pushViewController:[[QLMSearchFirstPageTableViewController alloc]init] animated:YES];
}


- (void)playingBtnClick{
    [self.navigationController pushViewController:[QLMPlayListViewController sharedPlayListViewController] animated:YES];
}

- (void)infoNotificationPlayBtnClick:(NSNotification *)notification{
    self.customBarItemView.hidden = NO;
    self.playingBtn.selected = [QLMPlayListViewController sharedPlayListViewController].playFlag;
}





- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}



- (QLMPlayingButton *)playingBtn{
    if (!_playingBtn) {
        _playingBtn = [QLMPlayingButton playingButton];
    }
    return _playingBtn;
}

@end
