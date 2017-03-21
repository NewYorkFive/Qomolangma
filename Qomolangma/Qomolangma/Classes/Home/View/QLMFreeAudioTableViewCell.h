//
//  QLMFreeAudioTableViewCell.h
//  Qomolangma
//
//  Created by 张晨晖 on 2017/3/18.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QLMFreeAudio.h"
#import "QLMPlayBtn.h"

@class QLMFreeAudioTableViewCell;
@protocol QLMFreeAudioTableViewCellDelegate <NSObject>

@optional
- (void)pushAll;

- (void)FreeAudioTableViewCellPushToPlayListViewControllerWithQLMPlayButton:(QLMPlayBtn *)button;

@end

@interface QLMFreeAudioTableViewCell : UITableViewCell

///音频model
@property (nonatomic ,strong) NSArray<QLMFreeAudio *> *freeAudioArray;

@property (nonatomic ,weak) id<QLMFreeAudioTableViewCellDelegate> delegate;

@property (nonatomic ,assign) BOOL isButtonSelected;

//高亮button
@property (nonatomic ,strong) UIButton *highlightedButton;

//播放button
@property (nonatomic ,strong) QLMPlayBtn *button6;

@end
