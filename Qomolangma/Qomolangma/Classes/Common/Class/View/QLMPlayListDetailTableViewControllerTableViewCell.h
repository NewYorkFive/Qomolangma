//
//  QLMPlayListDetailTableViewControllerTableViewCell.h
//  Qomolangma
//
//  Created by NowOrNever on 18/03/2017.
//  Copyright © 2017 Focus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QLMAudioModel.h"
@interface QLMPlayListDetailTableViewControllerTableViewCell : UITableViewCell

/**
 音频model
 */
@property (nonatomic, strong) QLMAudioModel *model;
@end
