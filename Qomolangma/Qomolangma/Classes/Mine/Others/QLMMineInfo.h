//
//  QLMMineInfo.h
//  Qomolangma
//
//  Created by Aioria on 2017/3/18.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QLMMineInfo : NSObject

@property (nonatomic, assign) BOOL isLogin;

@property (nonatomic, copy)NSString *nickName;

@property (nonatomic, copy)NSString *headerIconName;

+ (instancetype)sharedMineInfo;

@end
