//
//  QLMLearnViewController.h
//  Qomolangma
//
//  Created by NowOrNever on 15/03/2017.
//  Copyright © 2017 Focus. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QLMBaseViewController.h"
@interface QLMLearnViewController : QLMBaseViewController<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, assign) NSInteger currentPage;
@end
