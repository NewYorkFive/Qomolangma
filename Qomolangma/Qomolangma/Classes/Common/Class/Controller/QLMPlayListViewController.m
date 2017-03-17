//
//  QLMPlayListViewController.m
//  Qomolangma
//
//  Created by NowOrNever on 16/03/2017.
//  Copyright © 2017 Focus. All rights reserved.
//

#import "QLMPlayListViewController.h"

@interface QLMPlayListViewController ()
@property (nonatomic, assign) BOOL flag;
@end

@implementation QLMPlayListViewController


+ (instancetype)sharedPlayListViewController{
    static QLMPlayListViewController *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[QLMPlayListViewController alloc]init];
        instance.playFlag = NO;
    });
    return instance;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor darkGrayColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    btn.center = self.view.center;
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(playButtonClick) forControlEvents:UIControlEventTouchUpInside];
    
//    self.view.backgroundColor = [UIColor colorWithRed: 1 / 255.0 green: 150 / 255.0 blue: 1  alpha: 1];
    // Do any additional setup after loading the view.
}

- (void)playButtonClick{
    self.playFlag = !self.playFlag;
    [[NSNotificationCenter defaultCenter] postNotificationName:@"changePlayBtnStatus" object:nil];
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
