//
//  QLMMineHeaderView.h
//  Qomolangma
//
//  Created by Aioria on 2017/3/16.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QLMMineHeaderView : UIView

@property (nonatomic, copy)void (^modalBlock)();

@property (nonatomic, copy) NSString *nickName;

@end
