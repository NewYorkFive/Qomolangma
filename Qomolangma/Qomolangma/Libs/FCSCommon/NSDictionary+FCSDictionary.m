//
//  NSDictionary+FCSDictionary.m
//  test
//
//  Created by NowOrNever on 16/03/2017.
//  Copyright © 2017 Focus. All rights reserved.
//

#import "NSDictionary+FCSDictionary.h"

@implementation NSDictionary (FCSDictionary)
- (NSString *)fcs_descriptionWithLocale:(id)locale{
    NSMutableString *mStr = [NSMutableString string];
    [mStr appendString:@"{\n"];
    __block int count = 1;
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if (count++ == self.count) {
            [mStr appendFormat:@"\t%@:\t%@",key,obj];
        } else {
            [mStr appendFormat:@"\t%@:\t%@;\n",key,obj];
        }
    }];
    [mStr appendString:@"\n}"];
    return mStr.copy;
}
@end
