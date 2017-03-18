//
//  QLMPlayBtn.m
//  Qomolangma
//
//  Created by 张晨晖 on 2017/3/18.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMPlayBtn.h"

@implementation QLMPlayBtn

- (void)setFreeAudio:(QLMFreeAudio *)freeAudio {
    
    _freeAudio = freeAudio;
    
    
    if (_setNoTitle == NO) {//不设置图片
        
//        NSMutableAttributedString *attriString = [[NSMutableAttributedString alloc] initWithString:@"123"];
//        [attriString addAttribute:NSForegroundColorAttributeName
//                            value:[UIColor redColor]
//                            range:NSMakeRange(4, 2)];
//        
//        [self setAttributedTitle:attriString forState:UIControlStateNormal];
//        [self setAttributedTitle:attriString forState:UIControlStateSelected];
        
        //断点方式
        self.titleLabel.lineBreakMode =  NSLineBreakByTruncatingTail;
        //文字内容左边对齐
        self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        
        [self setTitle:freeAudio.resource_name forState:UIControlStateNormal];
        [self setTitle:freeAudio.resource_name forState:UIControlStateHighlighted];
    }
    
}

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]){
        [self setupUI];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self setupUI];
}

- (void)setupUI {
//
//    NSMutableAttributedString *attriString = [[NSMutableAttributedString alloc] initWithString:@"123"];
//    [attriString addAttribute:NSForegroundColorAttributeName
//                        value:[UIColor redColor]
//                        range:NSMakeRange(4, 2)];
    
//    [self setAttributedTitle:attriString forState:UIControlStateNormal];
//    [self setAttributedTitle:attriString forState:UIControlStateSelected];
    
    //    self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    //    self.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
    //    self.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    //    self.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    [self setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
