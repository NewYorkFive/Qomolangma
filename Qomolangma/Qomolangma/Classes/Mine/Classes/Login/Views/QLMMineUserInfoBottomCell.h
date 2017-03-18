//
//  QLMMineUserInfoBottomCell.h
//  Qomolangma
//
//  Created by Aioria on 2017/3/18.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QLMMineUserInfoBottomCell : UITableViewCell

/**
 设置cell上显示内容的字典
 */
@property (nonatomic, strong)NSDictionary *dicDescription;

/**
 用于修改个人信息的textField
 */
@property (nonatomic, strong)UITextField *txtDetail;

@end
