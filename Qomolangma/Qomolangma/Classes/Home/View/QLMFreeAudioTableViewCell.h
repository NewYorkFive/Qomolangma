//
//  QLMFreeAudioTableViewCell.h
//  Qomolangma
//
//  Created by 张晨晖 on 2017/3/18.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QLMFreeAudio.h"

@interface QLMFreeAudioTableViewCell : UITableViewCell

///音频model
@property (nonatomic ,strong) NSArray<QLMFreeAudio *> *freeAudioArray;

@end
