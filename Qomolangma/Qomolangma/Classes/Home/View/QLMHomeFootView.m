//
//  QLMHomeFootView.m
//  Qomolangma
//
//  Created by 张晨晖 on 2017/3/17.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMHomeFootView.h"

@interface QLMHomeFootView ()



@end

@implementation QLMHomeFootView

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]){
        [self setupUI];
    }
    return self;
}


- (void)setupUI
{
    self.backgroundColor = [UIColor grayColor];
    
    
    CGFloat margin = 15;
    

    UIButton *btnLast = nil;
    
    CGFloat height = 60;
    
    CGFloat width = (kScreenWidth - margin * 3) / 2;
    
    for (NSInteger i = 0; i < 4; i++) {
        
        UIButton *button = [[UIButton alloc] init];
        
        button.backgroundColor = [UIColor fcs_randomColor];
        
        [self addSubview:button];
        
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.offset(height);
            
            make.width.offset(width);
            
            float colTop = (15 + i / 2 * (margin + height));
            
            make.top.offset(colTop);
            
            
            if (i % 2 == 0)
            {
                make.left.offset(margin);
                
            }else
            {
                make.left.equalTo(btnLast.mas_right).offset(margin);
            }
        }];
        
        btnLast = button;
    }

}



@end
