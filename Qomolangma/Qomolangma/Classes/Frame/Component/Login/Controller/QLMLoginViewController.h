//
//  QLMLoginViewController.h
//  Qomolangma
//
//  Created by NowOrNever on 18/03/2017.
//  Copyright © 2017 Focus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QLMLoginViewController : UIViewController

/**
 dissmiss调用的block
 */
@property (nonatomic, copy) void(^dissmissBlock)(id responseObject);

@end
