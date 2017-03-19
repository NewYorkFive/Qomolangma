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

//@property (nonatomic, copy) NSString *mineUserInfoUserName;
//
//@property (nonatomic, copy) NSString *headerIconName;
//
//@property (nonatomic, copy) NSString *mineUserInfoPassWord;
//
//@property (nonatomic, copy) NSString *mineUserInfoGender;
//
//@property (nonatomic, copy) NSString *mineUserInfoBornYear;
//
//@property (nonatomic, copy) NSString *mineUserInfoEducation;
//
//@property (nonatomic, copy) NSString *mineUserInfoIndustry;
//
//@property (nonatomic, copy) NSString *mineUserInfoCareer;

@property (nonatomic, strong) NSMutableDictionary *infoDict;

+ (instancetype)sharedMineInfo;

@end



