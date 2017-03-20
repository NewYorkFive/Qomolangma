//
//  QLMMineEmitterLayer.h
//  Qomolangma
//
//  Created by Aioria on 2017/3/20.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@class UIImage;
@class UIColor;

@protocol QLMMineEmitterLayerDelegate <NSObject>

- (void)mineEmitterLayerAnimEnd;

@end
@interface QLMMineEmitterLayer : CALayer

@property(nonatomic, assign)CGPoint beginPoint;
@property(nonatomic, assign)BOOL ignoredBlack;
@property(nonatomic, assign)BOOL ignoredWhite;
@property(nonatomic, strong)UIColor* customColor;
@property(nonatomic, assign)CGFloat randomPointRange;

@property(nonatomic,assign)uint32_t maxParticleCount;
@property(nonatomic,strong)UIImage* image;

@property(nonatomic,weak)id  <QLMMineEmitterLayerDelegate> mineEmitterLayerdelegate;

-(void)restart;

@end
