//
//  QLMMineInfoModel.m
//  Qomolangma
//
//  Created by Aioria on 2017/3/16.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMMineInfoModel.h"


@implementation QLMMineInfoModel

+ (QLMMineInfoModel *)mineInfoModelWithDict: (NSDictionary *)dict
{
    QLMMineInfoModel *mineInfoModel = [[QLMMineInfoModel alloc] init];
    
    [mineInfoModel setValuesForKeysWithDictionary:dict];
    
    return mineInfoModel;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{

}

@end
