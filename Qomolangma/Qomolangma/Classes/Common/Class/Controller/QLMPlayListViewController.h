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

@property (nonatomic, assign) BOOL playFlag;
@property (nonatomic, strong) NSMutableArray<QLMAudioModel *> *playListModelArray;
@property (nonatomic, strong) QLMAudioModel *currentAudioModel;
@property (nonatomic, assign) BOOL isVideo;
+ (instancetype)sharedPlayListViewController;

@end
