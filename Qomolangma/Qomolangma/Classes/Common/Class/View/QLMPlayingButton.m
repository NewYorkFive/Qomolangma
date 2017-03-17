//
//  QLMPlayingButton.m
//  Qomolangma
//
//  Created by NowOrNever on 16/03/2017.
//  Copyright © 2017 Focus. All rights reserved.
//

#import "QLMPlayingButton.h"
#import "QLMPlayListViewController.h"
@implementation QLMPlayingButton
+ (instancetype)playingButton{
    QLMPlayingButton *btn = [QLMPlayingButton fcs_buttonWithImageName:@"navbar_playing_icon_anim_1_44x44_"];
    [btn setImage:[UIImage animatedImageWithImages:[self createImage] duration:1.0] forState:UIControlStateSelected];
    btn.selected = [QLMPlayListViewController sharedPlayListViewController].playFlag;
    [btn sizeToFit];
    return btn;
}

+ (NSArray<UIImage *> *)createImage{
    NSMutableArray *mArr = [NSMutableArray array];
    for (int i = 1; i < 13; i++) {
        [mArr addObject:[UIImage imageNamed:[NSString stringWithFormat:@"navbar_playing_icon_anim_%zd_44x44_",i]]];
    }
    return mArr;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
