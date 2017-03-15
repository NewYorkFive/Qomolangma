//
//  NSObject+FCSObject.m
//  test
//
//  Created by NowOrNever on 16/03/2017.
//  Copyright © 2017 Focus. All rights reserved.
//

#import "NSObject+FCSObject.h"

@implementation NSObject (FCSObject)
- (instancetype)fcs_dictToPropertyWithDict:(NSDictionary *)dict{
    [self setValuesForKeysWithDictionary:dict];
    return self;
}

+ (instancetype)fcs_createObjectWithDict:(NSDictionary *)dict{
    return [[[self alloc]init] fcs_dictToPropertyWithDict:dict];
}

@end
