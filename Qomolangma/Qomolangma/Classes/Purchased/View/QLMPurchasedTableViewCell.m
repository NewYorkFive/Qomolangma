//
//  QLMPurchasedTableViewCell.m
//  Qomolangma
//
//  Created by 王惠平 on 2017/3/17.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMPurchasedTableViewCell.h"
#import <UIImageView+WebCache.h>

@interface QLMPurchasedTableViewCell ()

@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *purchasedImageView;

@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *purchasedLabel;

@end

@implementation QLMPurchasedTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self =  [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        //[self setupUI];
    }
    
    return self;
    
}

- (void)awakeFromNib {
    
    [super awakeFromNib];
    //[self setupUI];
    
    
    //_tableViewVC.tableView.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256)/255.0 green:arc4random_uniform(256)/255.0 blue:arc4random_uniform(256)/255.0 alpha:1];
}


- (void)setupUI {
    
    NSArray  *dataArray = [[NSArray alloc] initWithObjects:@"aizaixianjingderizi.jpeg",@"anshizhangda.jpeg",@"bubizhidaowoshishui.jpeg",@"dangnigudannihuixiangqishui.jpeg",@"hudielaiguozheshijie.jpeg",@"liaiyigeIDdejuli.jpeg",@"shalou.jpeg",@"shinian.jpeg",@"tangyi.jpeg",@"tiaopin.jpeg",@"wobushinideyuanjia.jpeg",@"woyaowomenzaiyiqi.jpeg",@"xiaofudequnbai.jpeg",@"xiaoyaodejinsechengbao.jpeg",@"zuishuxidemoshengren.jpeg",@"zuoer.jpg",@"zuoerzhongjie.jpeg",@"aizaixianjingderizi.jpeg", nil];
    
    for (int i = 0; i < self.purchasedImageView.count; i++) {
        
        UIImage *image = [UIImage imageNamed:[dataArray objectAtIndex:i]];
        
        //获取对应的imageView
        UIImageView *imageView = self. purchasedImageView[i];
        
        imageView.image = image;
    
    }

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
