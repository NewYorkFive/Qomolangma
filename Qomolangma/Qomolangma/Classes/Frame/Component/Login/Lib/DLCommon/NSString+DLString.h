//
//  NSString+DLString.h
//
//  Created by NowOrNever on 24/02/2017.
//  Copyright © 2017 NowOrNever. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DLString)


/**
 增加沙盒路径
 @return 返回一个路径(cache路径+当前名称)
 */
- (NSString *)dl_appendCachePath;

@end
