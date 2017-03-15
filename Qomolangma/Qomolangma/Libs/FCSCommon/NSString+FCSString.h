//
//  NSString+FCSString.h
//  test
//
//  Created by NowOrNever on 16/03/2017.
//  Copyright © 2017 Focus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (FCSString)
/**
 增加沙盒路径
 @return 返回一个路径(cache路径+当前名称)
 */
- (NSString *)fcs_appendCachePath;

@end
