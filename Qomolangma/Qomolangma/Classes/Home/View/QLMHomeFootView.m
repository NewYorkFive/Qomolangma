//
//  QLMHomeFootView.m
//  Qomolangma
//
//  Created by 张晨晖 on 2017/3/17.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMHomeFootView.h"
#import "QLMRecommendButton.h"

@interface QLMHomeFootView ()

@property (nonatomic ,strong) NSArray<QLMRecommendButton *> *recommendButtonArray;

@end

@implementation QLMHomeFootView

- (void)setRecommendArray:(NSArray<QLMRecommend *> *)recommendArray {
    
    _recommendArray = recommendArray;
    //加载数据
    for (int i = 0; i < self.recommendButtonArray.count; i++) {
        self.recommendButtonArray[i].recommend = recommendArray[i];
    }
    
}

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]){
        [self setupUI];
    }
    return self;
}


- (void)setupUI
{
//    self.backgroundColor = [UIColor grayColor];
    self.backgroundColor = [UIColor whiteColor];
    
    CGFloat margin = 15;
    

    UIButton *btnLast = nil;
    
    CGFloat height = 100;
    
    CGFloat width = (kScreenWidth - margin * 3) / 2;
    
    NSMutableArray *arrayM = [NSMutableArray array];
    
    for (NSInteger i = 0; i < 4; i++) {
        
        QLMRecommendButton *button = [[QLMRecommendButton alloc] init];
        
        button.backgroundColor = [UIColor fcs_randomColor];
        
        [self addSubview:button];
        
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.offset(height);
            
            make.width.offset(width);
            
            //行高
            float colTop = (15 + i / 2 * (margin + height));
            
            make.top.offset(colTop);
            
            
            if (i % 2 == 0)
            {
                make.left.offset(margin);
                
            } else
            {
                make.left.equalTo(btnLast.mas_right).offset(margin);
            }
        }];
        
        btnLast = button;
        [arrayM addObject:button];
        //切一下圆角
        button.layer.cornerRadius = 8;
        button.layer.masksToBounds = YES;
        button.layer.borderColor = (__bridge CGColorRef _Nullable)([UIColor whiteColor]);
        button.layer.borderWidth = 2;
        
    }
    self.recommendButtonArray = arrayM.copy;

}



@end
