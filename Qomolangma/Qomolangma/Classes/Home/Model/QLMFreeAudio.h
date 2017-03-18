//
//  QLMFreeAudio.h
//  Qomolangma
//
//  Created by 张晨晖 on 2017/3/16.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QLMFreeAudio : NSObject

///多余字段1
@property (nonatomic, strong) NSString *resource_content;

///多余字段2
@property (nonatomic, strong) NSString *image_url;

///音频内容
@property (nonatomic, strong) NSString *resource_name;

///音频地址
@property (nonatomic, strong) NSString *audio_file_url;

@end
