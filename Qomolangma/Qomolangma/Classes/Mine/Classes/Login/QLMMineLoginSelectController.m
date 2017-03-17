//
//  QLMMineLoginSelectController.m
//  Qomolangma
//
//  Created by Aioria on 2017/3/16.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMMineLoginSelectController.h"

@interface QLMMineLoginSelectController ()

@end

@implementation QLMMineLoginSelectController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)setupUI
{
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    self.navigationController.navigationBar.hidden = YES;
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
