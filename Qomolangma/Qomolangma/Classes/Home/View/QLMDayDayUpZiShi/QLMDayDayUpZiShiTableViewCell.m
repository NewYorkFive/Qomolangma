//
//  QLMDayDayUpZiShiTableViewCell.m
//  Qomolangma
//
//  Created by 张晨晖 on 2017/3/20.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMDayDayUpZiShiTableViewCell.h"
#import <AVFoundation/AVFoundation.h>

@interface QLMDayDayUpZiShiTableViewCell ()

@end

@implementation QLMDayDayUpZiShiTableViewCell

- (void)setFreeAudio:(QLMFreeAudio *)freeAudio {
    
    _freeAudio = freeAudio;
    //把数据放到控件上
    self.textLabel.text = freeAudio.resource_name;
    
    //异步加载数据
    dispatch_queue_t queue = dispatch_queue_create("abc", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        NSURL *url = [NSURL URLWithString:_freeAudio.audio_file_url];
        AVURLAsset *mp3Asset = [AVURLAsset URLAssetWithURL:url options:nil];
        NSUInteger second = 0;
        second = mp3Asset.duration.value / mp3Asset.duration.timescale;
        NSString *str1 = [NSString stringWithFormat:@"%zd",second];
        NSInteger length = str1.length;
        NSString *str2 = [str1 substringToIndex:length - 2];
        NSString *str3 = [str1 substringFromIndex:length - 2];
        NSMutableString *strM = [NSMutableString string];
        [strM appendString:str2];
        [strM appendString:@":"];
        [strM appendString:str3];
        NSString *time = strM.copy;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.detailTextLabel.text = time;
        });

    });
    
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    [self setupUI];
    return self;
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self setupUI];
}

- (void)setupUI {
    
    //取消选中状态
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
    self.detailTextLabel.text = @"00:00";

    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
