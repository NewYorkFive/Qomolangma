//
//  QLMAudioModel.h
//  Qomolangma
//
//  Created by NowOrNever on 18/03/2017.
//  Copyright © 2017 Focus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QLMAudioModel : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *modelDescription;
@property (nonatomic, copy) NSString *timeLength;
+ (instancetype)randomAudio;
@end
