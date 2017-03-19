//
//  NSObject+DLObject.h
//  test
//
//  Created by NowOrNever on 16/03/2017.
//  Copyright © 2017 Focus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (DLObject)
- (instancetype)dl_dictToPropertyWithDict:(NSDictionary *)dict;
+ (instancetype)dl_createObjectWithDict:(NSDictionary *)dict;

@end
