//
//  QLMAudioModel.m
//  Qomolangma
//
//  Created by NowOrNever on 18/03/2017.
//  Copyright © 2017 Focus. All rights reserved.
//

#import "QLMAudioModel.h"

@implementation QLMAudioModel
+ (instancetype)randomAudio{
    QLMAudioModel *model = [[QLMAudioModel alloc]init];
    model.name = [NSString stringWithFormat:@"randomAudio%zd",arc4random_uniform(2000)];
    return model;
}
@end
