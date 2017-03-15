//
//  QLMHomeViewController.m
//  Qomolangma
//
//  Created by NowOrNever on 15/03/2017.
//  Copyright © 2017 Focus. All rights reserved.
//

#import "QLMHomeViewController.h"

@interface QLMHomeViewController ()

//主页数据
@property (nonatomic ,strong) NSDictionary *homeDataDic;

@end

@implementation QLMHomeViewController

#pragma 1 - 创建UITableView
- (instancetype)init {
    
    return [self initWithStyle:UITableViewStyleGrouped];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    [self loadData];
    
}

#pragma 2 - 加载首页数据
- (void)loadData {
    
    //加载数据
    NSURL *url = [NSURL URLWithString:@"http://iosapi.itcast.cn:8080/app/home/getHomeData"];
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    if (data == nil) {//网络有问题
        //弹出错误信息    /////////这里需要用到弹出
        NSLog(@"错误");
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"没有网络" preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:alert animated:YES completion:^{
            //完成取消
            [NSThread sleepForTimeInterval:1.0f];
            [alert dismissViewControllerAnimated:YES completion:nil];
        }];
        
    } else {
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSDictionary *homeDataDic = [dic objectForKey:@"data"];
        self.homeDataDic = homeDataDic;
//        NSLog(@"homeDataDic:%@",homeDataDic);
    }
    
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
