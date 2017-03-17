//
//  QLMBaseViewController.m
//  Qomolangma
//
//  Created by NowOrNever on 17/03/2017.
//  Copyright © 2017 Focus. All rights reserved.
//

#import "QLMBaseViewController.h"
#import "QLMPlayListViewController.h"
@interface QLMBaseViewController ()
@end

@implementation QLMBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self baseSetupUI];
}

- (void)baseSetupUI{
    [self setupNavigationBar];
}

- (void)setupNavigationBar{
    UIView *customBarItemView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 45, 35)];
    QLMPlayingButton *playingBtn = self.playingBtn;
    playingBtn.center = CGPointMake(customBarItemView.bounds.size.width * 0.5, customBarItemView.bounds.size.height * 0.5);
    [customBarItemView addSubview:playingBtn];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:customBarItemView];
    [playingBtn addTarget:self action:@selector(playingBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(infoNotificationPlayBtnClick:) name:@"changePlayBtnStatus" object:nil];
    
}


- (void)playingBtnClick{
    [self.navigationController pushViewController:[QLMPlayListViewController sharedPlayListViewController] animated:YES];
}

- (void)infoNotificationPlayBtnClick:(NSNotification *)notification{
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
