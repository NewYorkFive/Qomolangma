//
//  NSObject+DLObject.m
//  test
//
//  Created by NowOrNever on 16/03/2017.
//  Copyright © 2017 Focus. All rights reserved.
//

#import "NSObject+DLObject.h"

@implementation NSObject (DLObject)

- (instancetype)dl_dictToPropertyWithDict:(NSDictionary *)dict{
    [self setValuesForKeysWithDictionary:dict];
    return self;
}

+ (instancetype)dl_createObjectWithDict:(NSDictionary *)dict{
    return [[[self alloc]init] dl_dictToPropertyWithDict:dict];
}


@end
