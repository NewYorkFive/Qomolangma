//
//  QLMAudioModel.h
//  Qomolangma
//
//  Created by NowOrNever on 18/03/2017.
//  Copyright © 2017 Focus. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QLMAudioModel : NSObject




/**
 标题
 */
@property (nonatomic, copy) NSString *title;

/**
 模型描述
 */
@property (nonatomic, copy) NSString *modelDescription;

/**
 时间长度
 */
@property (nonatomic, copy) NSString *timeLength;

/**
 喜欢个数
 */
@property (nonatomic, assign) NSInteger like_count;

/**
 资源内容
 */
@property (nonatomic, copy) NSString *resource_content;

/**
 图片url
 */
@property (nonatomic, copy) NSString *image_url;

/**
 资源类型
 */
@property (nonatomic, copy) NSString *resource_type;

/**
 文件大小
 */
@property (nonatomic, copy) NSString *file_size;

/**
 文件编码方式
 */
@property (nonatomic, copy) NSString *resource_enclosure;

/**
 分类id
 */
@property (nonatomic, copy) NSString *category_id;

/**
 价格
 */
@property (nonatomic, assign) CGFloat price;

/**
 财富值
 */
@property (nonatomic, assign) NSInteger worthy_count;

/**
 资源id
 */
@property (nonatomic, assign) NSInteger resource_id;

/**
 不赞成数
 */
@property (nonatomic, assign) NSInteger unlike_count;

/**
 资源名称
 */
@property (nonatomic, copy) NSString *resource_name;

/**
 添加时间
 */
@property (nonatomic, assign) NSInteger add_time;

/**
 音频资源url
 */
@property (nonatomic, copy) NSString *audio_file_url;

/**
 卖出份数
 */
@property (nonatomic, assign) NSInteger sold_count;




+ (instancetype)randomAudio;
@end


//like_count: 0,
//resource_content: "主打创业心理学，专治各种想不开。今日排行榜联合发起人杨铄今带你围绕一本书、一部电影、一首音乐，展现隐藏在每个创业者心中的价值观冲突，一年带你读365本非虚构类书籍	",
//image_url: "http://dgtt.besttoptoday.com/resource/image/20161205/20161205521.jpg",
//resource_type: "0",
//file_size: 43577732,
//resource_enclosure: "2180",
//category_id: "13",
//price: 365,
//worthy_count: 0,
//resource_id: 143,
//unlike_count: 1,
//resource_name: "11.6专治各种想不开丨员工不知道心疼公司的钱怎么办？",
//add_time: 1478361600,
//audio_file_url: "http://dgtt.besttoptoday.com/resource/mp3/20161205/201612056669.mp3"
//},
