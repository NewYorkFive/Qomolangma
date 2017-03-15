//
//  NSArray+FCSArray.h
//  test
//
//  Created by NowOrNever on 16/03/2017.
//  Copyright © 2017 Focus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (FCSArray)
+ (NSArray *)fcs_plistToClassWithPlistName:(NSString *)plistName andClassName:(NSString *)className;
@end
