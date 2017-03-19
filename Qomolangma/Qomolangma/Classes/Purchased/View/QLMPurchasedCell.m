//
//  MyCollectionViewCell.m
//  CanPlay
//
//  Created by liyuli on 16/11/2.
//  Copyright © 2016年 6mai. All rights reserved.
//

#import "QLMPurchasedCell.h"
#import <UIImageView+WebCache.h>
@implementation QLMPurchasedCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setModel:(QLMPurchasedModel *)model{
    _model = model;
    
    self.botlabel.text = [NSString stringWithFormat:@"%@%zd",model.name,arc4random_uniform(40)];
    
    [self.babyImageView sd_setImageWithURL:[NSURL URLWithString:model.image_url]];
}

@end
