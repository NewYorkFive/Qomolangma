//
//  NSObject+FCSObject.h
//  test
//
//  Created by NowOrNever on 16/03/2017.
//  Copyright © 2017 Focus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (FCSObject)
- (instancetype)fcs_dictToPropertyWithDict:(NSDictionary *)dict;
+ (instancetype)fcs_createObjectWithDict:(NSDictionary *)dict;

@end
