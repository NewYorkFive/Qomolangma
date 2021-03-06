//
//  QLMFreeAudioTableViewCell.m
//  Qomolangma
//
//  Created by 张晨晖 on 2017/3/18.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMFreeAudioTableViewCell.h"
#import "QLMPlayBtn.h"
#import <AVFoundation/AVFoundation.h>
#import "QLMPlayListViewController.h"

@interface QLMFreeAudioTableViewCell ()

@property (nonatomic ,strong) QLMPlayBtn *button1;

@property (nonatomic ,strong) QLMPlayBtn *button2;

@property (nonatomic ,strong) QLMPlayBtn *button3;

@property (nonatomic ,strong) QLMPlayBtn *button4;

@property (nonatomic ,strong) QLMPlayBtn *button5;

@end

@implementation QLMFreeAudioTableViewCell

- (void)setIsButtonSelected:(BOOL)isButtonSelected {
    
    _isButtonSelected = isButtonSelected;
    self.button6.selected = isButtonSelected;
    
}

- (void)setFreeAudioArray:(NSArray<QLMFreeAudio *> *)freeAudioArray {
    
    _freeAudioArray = freeAudioArray;
    //把数据放到控件上
    _button1.freeAudio = freeAudioArray[0];
    _button2.freeAudio = freeAudioArray[1];
    _button3.freeAudio = freeAudioArray[2];
    _button4.freeAudio = freeAudioArray[3];
    _button5.freeAudio = freeAudioArray[4];
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {

//    self.player = [[AVPlayer alloc] init];
    
    CGFloat buttonWidth = [UIScreen mainScreen].bounds.size.width * 2 / 3;
    
    //天天涨姿势
    UILabel *label = [[UILabel alloc] init];
    label.text = @"天天涨姿势";
    label.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(16);
        make.left.offset(8);
    }];
    
    //小箭头
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"common_icon_arrow"];
    [self.contentView addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(label.mas_centerY);
        make.right.offset(-16);
    }];
    
    //顶部"查看听书日历"
    UIButton *button = [[UIButton alloc] init];
    [self.contentView addSubview:button];
    [button setTitle:@"查看全部" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [button setAlpha:.6];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(label.mas_centerY);
        make.right.equalTo(imageView.mas_left);
    }];
    [button addTarget:_delegate action:@selector(pushAll) forControlEvents:UIControlEventTouchUpInside];
    
    //中间的线
    UILabel *line1 = [[UILabel alloc] init];
    line1.backgroundColor = [UIColor grayColor];
    line1.alpha = .4;
    [self.contentView addSubview:line1];
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label.mas_bottom).offset(16);
        make.left.offset(16);
        make.right.offset(-16);
        make.height.offset(1);
    }];
    
    //小箭头1
    UIImageView *imageView1 = [[UIImageView alloc] init];
    imageView1.image = [UIImage imageNamed:@"new_main_audio_jiantou"];
    [self.contentView addSubview:imageView1];
    [imageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line1).offset(24);
        make.left.offset(8);
    }];
    self.button1 = [[QLMPlayBtn alloc] init];
    [self.contentView addSubview:_button1];
    [_button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(imageView1.mas_centerY);
        make.left.equalTo(imageView1.mas_right);
        make.width.offset(buttonWidth);
    }];
    
    //小箭头2
    UIImageView *imageView2 = [[UIImageView alloc] init];
    imageView2.image = [UIImage imageNamed:@"new_main_audio_jiantou"];
    [self.contentView addSubview:imageView2];
    [imageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageView1.mas_bottom).offset(16);
        make.left.offset(8);
    }];
    
    self.button2 = [[QLMPlayBtn alloc] init];
    [self.contentView addSubview:_button2];
    [_button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(imageView2.mas_centerY);
        make.left.equalTo(imageView2.mas_right);
        make.width.offset(buttonWidth);
    }];
    
    //小箭头3
    UIImageView *imageView3 = [[UIImageView alloc] init];
    imageView3.image = [UIImage imageNamed:@"new_main_audio_jiantou"];
    [self.contentView addSubview:imageView3];
    [imageView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageView2.mas_bottom).offset(16);
        make.left.offset(8);
    }];
    
    self.button3 = [[QLMPlayBtn alloc] init];
    [self.contentView addSubview:_button3];
    [_button3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(imageView3.mas_centerY);
        make.left.equalTo(imageView3.mas_right);
        make.width.offset(buttonWidth);
    }];
    
    //小箭头4
    UIImageView *imageView4 = [[UIImageView alloc] init];
    imageView4.image = [UIImage imageNamed:@"new_main_audio_jiantou"];
    [self.contentView addSubview:imageView4];
    [imageView4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageView3.mas_bottom).offset(16);
        make.left.offset(8);
    }];
    
    self.button4 = [[QLMPlayBtn alloc] init];
    [self.contentView addSubview:_button4];
    [_button4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(imageView4.mas_centerY);
        make.left.equalTo(imageView4.mas_right);
        make.width.offset(buttonWidth);
    }];
    
    //小箭头5
    UIImageView *imageView5 = [[UIImageView alloc] init];
    imageView5.image = [UIImage imageNamed:@"new_main_audio_jiantou"];
    [self.contentView addSubview:imageView5];
    [imageView5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageView4.mas_bottom).offset(16);
        make.left.offset(8);
    }];
    
    self.button5 = [[QLMPlayBtn alloc] init];
    [self.contentView addSubview:_button5];
    [_button5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(imageView5.mas_centerY);
        make.left.equalTo(imageView5.mas_right);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-40);
        make.width.offset(buttonWidth);
    }];
    
    //播放按钮
    self.button6 = [[QLMPlayBtn alloc] init];
    _button6.setNoTitle = YES;
    
    [_button6 setImage:[UIImage imageNamed:@"new_main_audio_play_icon"] forState:UIControlStateNormal];
    [_button6 setImage:[UIImage imageNamed:@"new_main_audio_parse_icon"] forState:UIControlStateSelected];
    [self.contentView addSubview:_button6];
    
    [self.button6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY).offset(32);
        make.right.offset(-16);
    }];
    
    [_button1 addTarget:self action:@selector(buttonArrayClick:) forControlEvents:UIControlEventTouchUpInside];
    [_button2 addTarget:self action:@selector(buttonArrayClick:) forControlEvents:UIControlEventTouchUpInside];
    [_button3 addTarget:self action:@selector(buttonArrayClick:) forControlEvents:UIControlEventTouchUpInside];
    [_button4 addTarget:self action:@selector(buttonArrayClick:) forControlEvents:UIControlEventTouchUpInside];
    [_button5 addTarget:self action:@selector(buttonArrayClick:) forControlEvents:UIControlEventTouchUpInside];
    [_button6 addTarget:self action:@selector(playClick:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)buttonArrayClick:(QLMPlayBtn *)button {
    
    //清除上一个高亮
    self.highlightedButton.selected = NO;
    self.highlightedButton = button;
    button.selected = YES;
    [_delegate FreeAudioTableViewCellPushToPlayListViewControllerWithQLMPlayButton:button];

}

//大button的点击事件
- (void)playClick:(QLMPlayBtn *)button {
    
    //播放按钮的选中状态
//    button.selected = !button.selected;
    if (button == nil) { //因为上来默认是没选中.所以button里面的属性是nil/所以默认播放第一首
        
        _button1.selected = YES;//把button1的点击状态改成选中
        button.freeAudio = self.button1.freeAudio;
        
        //button6的数据给button1
        self.button6 = self.button1;
        
//        NSURL * url  = [NSURL URLWithString:button.freeAudio.audio_file_url];
//        self.player = [[AVPlayer alloc] initWithURL:url];
        //播放
//        [_player play];
        
    } else if (button.selected == YES) {//因为点击之后就改变了.所以现在是暂停状态
        
//        [_player play];
        
    } else {
   
//        [_player pause];
    }
    
//    //暂停
//    [_player pause];
    [_delegate FreeAudioTableViewCellPushToPlayListViewControllerWithQLMPlayButton:button];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
