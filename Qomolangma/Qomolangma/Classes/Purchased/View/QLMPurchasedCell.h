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

@property (nonatomic, strong) QLMPurchasedModel *model;

@property (weak, nonatomic) IBOutlet UILabel *botlabel;

@property (weak, nonatomic) IBOutlet UIImageView *babyImageView;


@end
