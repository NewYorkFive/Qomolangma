//
//  AppDelegate.m
//  Qomolangma
//
//  Created by NowOrNever on 15/03/2017.
//  Copyright © 2017 Focus. All rights reserved.
//

#import "AppDelegate.h"
#import "QLMFrameViewController.h"
#import "QLMLoginViewController.h"
#import <AVOSCloud/AVOSCloud.h>
#import <AVOSCloudCrashReporting/AVOSCloudCrashReporting.h>

#define APP_ID @"XMU3tj5X1jMwyzE8FgAfE1nl-gzGzoHsz"
#define APP_KEY @"k5FtL9i5r8iPdjU4jPcoA2K7"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler {
    
    if ([shortcutItem.type isEqualToString:@"item1"]) {//跳转分享页面
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/FocusTheOne/Qomolangma"]];
   
    } else if ([shortcutItem.type isEqualToString:@"item2"]) { //打开订阅文章
             UITabBarController *tabBar = (UITabBarController *) [[UIApplication sharedApplication].windows firstObject].rootViewController;
        tabBar.selectedIndex = 1;
//        self.frameVc.selectedIndex = 1;
        
    } else if ([shortcutItem.type isEqualToString:@"item3"]) { //打开随时听页面
        
        UITabBarController *tabBar = (UITabBarController *) [[UIApplication sharedApplication].windows firstObject].rootViewController;
        tabBar.selectedIndex = 2;
//        self.frameVc.selectedIndex = 2;
  
    } else if ([shortcutItem.type isEqualToString:@"item4"]) { //打开已购
        
        UITabBarController *tabBar = (UITabBarController *) [[UIApplication sharedApplication].windows firstObject].rootViewController;
        tabBar.selectedIndex = 3;
//        self.frameVc.selectedIndex = 3;
    
    }
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //设置一下3DTouch功能
    /** 定义 shortcutItem  */
    UIApplicationShortcutIcon *icon1 = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeShare];
    /** type 该item 唯一标识符
     localizedTitle ：标题
     localizedSubtitle：副标题
     icon：icon图标 可以使用系统类型 也可以使用自定义的图片
     userInfo：用户信息字典 自定义参数，完成具体功能需求
     */
    UIApplicationShortcutItem *item1 = [[UIApplicationShortcutItem alloc] initWithType:@"item1" localizedTitle:@"分享Qomolangma" localizedSubtitle:nil icon:icon1 userInfo:nil];

    UIApplicationShortcutIcon *icon2 = [UIApplicationShortcutIcon iconWithTemplateImageName:@"search_icon_rss"];
    UIApplicationShortcutItem *item2 = [[UIApplicationShortcutItem alloc] initWithType:@"item2" localizedTitle:@"订阅文章" localizedSubtitle:nil icon:icon2 userInfo:nil];
    
    
    //    UIApplicationShortcutIcon *icon2 = [UIApplicationShortcutIcon iconWithTemplateImageName:@"item2@3x.png"];
    UIApplicationShortcutIcon *icon3 = [UIApplicationShortcutIcon iconWithTemplateImageName:@"search_result_audio"];
    UIApplicationShortcutItem *item3 = [[UIApplicationShortcutItem alloc] initWithType:@"item3" localizedTitle:@"随时听" localizedSubtitle:nil icon:icon3 userInfo:nil];
    
    UIApplicationShortcutIcon *icon4 = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeConfirmation];
    UIApplicationShortcutItem *item4= [[UIApplicationShortcutItem alloc] initWithType:@"item4" localizedTitle:@"已购" localizedSubtitle:nil icon:icon4 userInfo:nil];

    /** 将items 添加到app图标 */
    application.shortcutItems = @[item4,item3,item2,item1];
    
    [AVOSCloudCrashReporting enable];
    [AVOSCloud setApplicationId:APP_ID clientKey:APP_KEY];
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    QLMFrameViewController *frameVc = [[QLMFrameViewController alloc]init];
//    self.frameVc = [[QLMFrameViewController alloc] init];
    NSString *userName = [[NSUserDefaults standardUserDefaults] objectForKey:kUserName];
    
    [QLMMineInfo sharedMineInfo].isLogin = userName.length;
    
    frameVc.selectedIndex = 2;
    
    
    
//    self.window.rootViewController = _frameVc;
    self.window.rootViewController = frameVc;
    [self.window makeKeyAndVisible];
    self.window.backgroundColor = [UIColor groupTableViewBackgroundColor];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    
    
    

//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        NSLog(@"ttttttttttt1");
//        if (![QLMMineInfo sharedMineInfo].isLogin) {
//            NSLog(@"ttttttttttt2");
//            [[frameVc.childViewControllers firstObject] presentViewController:[[QLMLoginViewController alloc]init] animated:YES completion:nil];
//            NSLog(@"ttttttttttt3");
//        }
//    });

    
    
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [[frameVc.childViewControllers firstObject] presentViewController:[[QLMLoginViewController alloc]init] animated:YES completion:nil];
//    });
    return YES;
    
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
