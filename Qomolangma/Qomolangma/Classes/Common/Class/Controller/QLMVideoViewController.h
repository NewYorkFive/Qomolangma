//
//  QLMVideoViewController.h
//  Qomolangma
//
//  Created by NowOrNever on 19/03/2017.
//  Copyright © 2017 Focus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QLMVideoModel.h"
@interface QLMVideoViewController : UIViewController
@property (nonatomic, assign) BOOL playFlag;
@property (nonatomic, strong) NSMutableArray<QLMVideoModel *> *playListVideoArray;
@property (nonatomic, strong) QLMVideoModel *currentAudioModel;

+ (instancetype)sharedVideoViewController;

@end
