//
//  QLMLearnFirstCellModel.h
//  Qomolangma
//
//  Created by 刘康 on 2017/3/19.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QLMLearnFirstCellModel : NSObject

@property(nonatomic,copy) NSString * price_unit;
@property (nonatomic, copy) NSString *person_info;
@property (nonatomic, copy) NSString *author;
@property (nonatomic, copy) NSString *image_url;
@property (nonatomic, assign) NSInteger price;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger *modelId;
@property (nonatomic, copy) NSString *content;
@property(nonatomic,assign) NSInteger subscribe_count;

@end
