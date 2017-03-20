//
//  MyCollectionViewCell.h
//  CanPlay
//
//  Created by liyuli on 16/11/2.
//  Copyright © 2016年 6mai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QLMPurchasedModel.h"
@interface QLMPurchasedCell : UICollectionViewCell

//定义模型
@property (nonatomic, strong) QLMPurchasedModel *model;

//已购列表标签
@property (weak, nonatomic) IBOutlet UILabel *botlabel;

//已购内容视图
@property (weak, nonatomic) IBOutlet UIImageView *babyImageView;


@end
