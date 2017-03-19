//
//  DLCycleCollectionViewCell.m
//  图片轮播器
//
//  Created by NowOrNever on 14/01/2017.
//  Copyright © 2017 NowOrNever. All rights reserved.
//

#import "DLCycleCollectionViewCell.h"
#import "Masonry.h"

@interface DLCycleCollectionViewCell ()
@property (nonatomic, weak) UIImageView *imageView;
@end

@implementation DLCycleCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupUI];
    // Initialization code
}

- (void)setupUI{
    UIImageView *imageView = [[UIImageView alloc]init];
    _imageView = imageView;
    [self.contentView addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];
}

//- (void)setImageURL:(NSURL *)imageURL{
//    _imageURL = imageURL;
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        NSData *data = [NSData dataWithContentsOfURL:imageURL];
//        UIImage *image = [UIImage imageWithData:data];
//        dispatch_async(dispatch_get_main_queue(), ^{
//            _imageView.image = image;
//        });
//    });
//}
//
- (void)setImageName:(NSString *)imageName{
    _imageName = imageName;
    _imageView.image = [UIImage imageNamed:imageName];
}

@end
