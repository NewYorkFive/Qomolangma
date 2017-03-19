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

@property (nonatomic, assign) NSInteger like_count;
@property (nonatomic, copy) NSString *resource_content;
@property (nonatomic, copy) NSString *image_url;
@property (nonatomic, copy) NSString *resource_type;
@property (nonatomic, copy) NSString *file_size;
@property (nonatomic, copy) NSString *resource_enclosure;
@property (nonatomic, copy) NSString *category_id;
@property (nonatomic, assign) CGFloat price;
@property (nonatomic, assign) NSInteger worthy_count;
@property (nonatomic, assign) NSInteger resource_id;
@property (nonatomic, assign) NSInteger unlike_count;
@property (nonatomic, copy) NSString *resource_name;
@property (nonatomic, assign) NSInteger add_time;
@property (nonatomic, copy) NSString *audio_file_url;
@property (nonatomic, assign) NSInteger sold_count;




+ (instancetype)randomAudio;
@end
