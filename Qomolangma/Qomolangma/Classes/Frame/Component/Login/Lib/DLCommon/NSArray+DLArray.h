//
//  NSArray+DLArray.h
//
//  Created by NowOrNever on 01/03/2017.
//  Copyright © 2017 NowOrNever. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (DLArray)
+ (NSArray *)dl_plistToClassWithPlistName:(NSString *)plistName andClassName:(NSString *)className;
@end
