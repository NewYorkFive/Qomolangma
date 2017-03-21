//
//  QLMPlayListViewController.h
//  Qomolangma
//
//  Created by NowOrNever on 16/03/2017.
//  Copyright © 2017 Focus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QLMAudioModel.h"
@interface QLMPlayListViewController : UIViewController


@property (nonatomic, strong) UILabel *topViewCurrentAudioTitleLabel;
@property (nonatomic, strong) UILabel *topViewCurrentAudioDescriptionLabel;

/**
 传入音频的url
 */
@property (nonatomic, strong) NSString *audioUrlString;

/**
 媒体的urlString，暂时没用到
 */
@property (nonatomic, strong) NSArray<NSString *> *urlStringArray;

/**
 navbutton上是否显示
 */
@property (nonatomic, assign) BOOL navButtonStatusHidden;

/**
 是否正在播放
 */
@property (nonatomic, assign) BOOL playFlag;

/**
 当前音频播放列表
 */
@property (nonatomic, strong) NSMutableArray<QLMAudioModel *> *playListModelArray;

/**
 当前音频model
 */
@property (nonatomic, strong) QLMAudioModel *currentAudioModel;

/**
 是否是video
 */
@property (nonatomic, assign) BOOL isVideo;

/**
 单例

 @return 返回单例
 */
+ (instancetype)sharedPlayListViewController;


@end
