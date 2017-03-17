//
//  QLMRankingDataTableViewCell.h
//  Qomolangma
//
//  Created by 张晨晖 on 2017/3/17.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QLMRankingData.h"

@interface QLMRankingDataTableViewCell : UITableViewCell

//热门排行榜
@property (nonatomic, strong) NSArray<QLMRankingData *> *rankingDataArray;

@end
