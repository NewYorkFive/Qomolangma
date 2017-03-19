//
//  QLMPlayBtn.h
//  Qomolangma
//
//  Created by 张晨晖 on 2017/3/18.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QLMFreeAudio.h"

@interface QLMPlayBtn : UIButton

@property (nonatomic ,strong) QLMFreeAudio *freeAudio;

@property (nonatomic ,assign) BOOL setNoTitle;

@end
