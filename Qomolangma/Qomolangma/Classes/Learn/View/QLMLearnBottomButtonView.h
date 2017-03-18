//
//  QLMLearnBottomButtonView.h
//  Qomolangma
//
//  Created by 刘康 on 2017/3/18.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QLMTestReadTableViewController.h"
#import "QLMPresntViewController.h"
#import "QLMLearnModelViewController.h"

@class QLMLearnBottomButtonView;
@protocol QLMLearnBottomButtonViewDelegate <NSObject>
@optional
- (void)learnBottomButtonView:(QLMLearnBottomButtonView *)learnBottomButtonView withTestReadTableViewController:(QLMTestReadTableViewController *)testReadTableViewController;
- (void)learnBottomButtonView:(QLMLearnBottomButtonView *)learnBottomButtonView withPresntViewController:(QLMLearnModelViewController *)presntViewController;

@end
@interface QLMLearnBottomButtonView : UIView

@property (nonatomic, weak) id<QLMLearnBottomButtonViewDelegate>testReadDelegate;
@end
