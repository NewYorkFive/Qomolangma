//
//  QLMMineConfirmEximPresentationController.m
//  Qomolangma
//
//  Created by Aioria on 2017/3/19.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMMineConfirmEximPresentationController.h"

@implementation QLMMineConfirmEximPresentationController

- (void)containerViewWillLayoutSubviews
{
    [super containerViewWillLayoutSubviews];
    
    [self.presentedView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.offset(0);
        make.height.offset(150);
    }];
    
    UIView *backgroundView = [[UIView alloc]init];
    backgroundView.backgroundColor = [UIColor blackColor];
    backgroundView.alpha = .4;
    [self.containerView insertSubview:backgroundView belowSubview:self.presentedView];
    
    [backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    
    [backgroundView addGestureRecognizer:tap];
}

- (void)tapAction: (UITapGestureRecognizer *)sender
{
    [self.presentedViewController dismissViewControllerAnimated:YES completion:nil];
}


@end
