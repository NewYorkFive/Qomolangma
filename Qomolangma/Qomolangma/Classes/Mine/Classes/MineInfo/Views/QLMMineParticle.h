//
//  QLMMineParticle.h
//  Qomolangma
//
//  Created by Aioria on 2017/3/20.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface QLMMineParticle : NSObject

@property(nonatomic, strong)UIColor* color;
@property(nonatomic, assign)CGPoint point;

@property(nonatomic, strong)UIColor* customColor;
@property(nonatomic, assign)CGFloat randomPointRange;
@property(nonatomic, assign)CGFloat delayTime;
@property(nonatomic, assign)CGFloat delayDuration;

@end
