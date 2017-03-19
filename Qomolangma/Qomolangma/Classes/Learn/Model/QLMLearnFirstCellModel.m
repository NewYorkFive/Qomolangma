//
//  QLMLearnFirstCellModel.m
//  Qomolangma
//
//  Created by 刘康 on 2017/3/19.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMLearnFirstCellModel.h"

@implementation QLMLearnFirstCellModel
- (void)setValue:(id)value forKey:(NSString *)key{
    NSLog(@"123");
    if ([key isEqualToString:@"id"]) {
        [self setValue:value forKey:@"modelId"];
        return;
    }
    [super setValue:value forKey:key];
    
}

//+ (NSDictionary *)modelCustomPropertyMapper {
//    return @{@"modelId" : @"id"};
//}

//+ (NSDictionary *)modelContainerPropertyGenericClass {
//    // value should be Class or Class name.
//    return @{@"id" : @"modelId" };
//}
@end
