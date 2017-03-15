//
//  NSString+FCSString.m
//  test
//
//  Created by NowOrNever on 16/03/2017.
//  Copyright © 2017 Focus. All rights reserved.
//

#import "NSString+FCSString.h"

@implementation NSString (FCSString)
- (NSString *)fcs_appendCachePath{
    NSString *path = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject;
    NSString *name = [self lastPathComponent];
    NSString *filePath = [path stringByAppendingPathComponent:name];
    return filePath;
}
@end
