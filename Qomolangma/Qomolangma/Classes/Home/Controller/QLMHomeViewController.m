//
//  QLMHomeViewController.m
//  Qomolangma
//
//  Created by NowOrNever on 15/03/2017.
//  Copyright © 2017 Focus. All rights reserved.
//

#import "QLMHomeViewController.h"
#import "QLMNetworkTools.h"

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
    
	NSString *URLStr = @"http://121.42.205.189:8080/app/home/getHomeData";
    [[QLMNetworkTools sharedTools] requestWithType:GET andUrlStr:URLStr andParams:nil andSuccess:^(id responseObject) {
        NSDictionary *responseData = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        self.homeDataDic = [responseData objectForKey:@"data"];
        NSLog(@"homeDataDic:%@",_homeDataDic);
    } andFailture:^(NSError *error) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"没有网络" preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:alert animated:YES completion:^{
            //完成取消
            [NSThread sleepForTimeInterval:.5f];
            [alert dismissViewControllerAnimated:YES completion:nil];
            NSLog(@"error:%@",error);
        }];
    }];


//    //加载数据
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    
//    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/plain", nil];
//    
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    
//    manager.requestSerializer = [AFJSONRequestSerializer serializer];
//    
//    NSString *URLStr = @"http://121.42.205.189:8080/app/home/getHomeData";
//    
//    [manager GET:URLStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        
////        NSString *html = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
////        NSLog(@"%@",html);
////        NSLog(@"%@",responseObject);
//        NSDictionary *responseData = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
//        NSLog(@"data:%@",responseData);
//        //        NSLog(@"%@", responseObject);
//        self.homeDataDic = [responseData objectForKey:@"data"];
//        NSLog(@"homeDataDic:%@",_homeDataDic);
//    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
////        NSLog(@"%@",error);
//        UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"没有网络" preferredStyle:UIAlertControllerStyleAlert];
//        [self presentViewController:alert animated:YES completion:^{
//            //完成取消
//            [NSThread sleepForTimeInterval:.5f];
//            [alert dismissViewControllerAnimated:YES completion:nil];
//        }];
//    }];
    
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
