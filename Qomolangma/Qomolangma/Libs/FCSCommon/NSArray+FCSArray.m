//
//  NSArray+FCSArray.m
//  test
//
//  Created by NowOrNever on 16/03/2017.
//  Copyright © 2017 Focus. All rights reserved.
//

#import "NSArray+FCSArray.h"
#import "NSObject+FCSObject.h"
@implementation NSArray (FCSArray)
+ (NSArray *)fcs_plistToClassWithPlistName:(NSString *)plistName andClassName:(NSString *)className{
    NSURL *plistUrl = [[NSBundle mainBundle]URLForResource:plistName withExtension:nil];
    NSArray *tempArray = [NSArray arrayWithContentsOfURL:plistUrl];
    NSMutableArray *targetArray = [[NSMutableArray alloc]init];
    Class ModelClass = NSClassFromString(className);
    for (NSDictionary * dict in tempArray) {
        [targetArray addObject:[ModelClass fcs_createObjectWithDict:dict]];
    }
    return targetArray.copy;
}
@end
