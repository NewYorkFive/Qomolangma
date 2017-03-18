//
//  QLMCarouselCell.m
//  Qomolangma
//
//  Created by 张晨晖 on 2017/3/16.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMHeadCell.h"
#import <Masonry.h>
#import <UIImageView+WebCache.h>

@interface QLMHeadCell ()

@property (nonatomic, weak) UIImageView *imageView;

@end

@implementation QLMHeadCell

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

- (void)setImageURL:(NSURL *)imageURL {
    _imageURL = imageURL;
    
//    // -------- 把url转化成image
//    // url -> data(二级制)
//    NSData *data = [NSData dataWithContentsOfURL:imageURL];
//    // data -> image
//    UIImage *image = [UIImage imageWithData:data];
//    // -------- 把url转化成image
    
    // 把数据放下控件上
    [self.imageView sd_setImageWithURL:imageURL];
}

- (void)setupUI {
 
    // cell上面就是一张图片
    UIImageView *imageView = [[UIImageView alloc] init];
    [self.contentView addSubview:imageView];
    
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
    
    self.imageView = imageView;
    
}

@end
