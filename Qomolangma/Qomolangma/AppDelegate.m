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


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [AVOSCloudCrashReporting enable];
    [AVOSCloud setApplicationId:APP_ID clientKey:APP_KEY];
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    QLMFrameViewController *frameVc = [[QLMFrameViewController alloc]init];
    
    NSString *userName = [[NSUserDefaults standardUserDefaults] objectForKey:kUserName];
    
    [QLMMineInfo sharedMineInfo].isLogin = userName.length;
    
    frameVc.selectedIndex = 2;
    
    self.window.rootViewController = frameVc;
    [self.window makeKeyAndVisible];
    self.window.backgroundColor = [UIColor groupTableViewBackgroundColor];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"ttttttttttt1");
        if (![QLMMineInfo sharedMineInfo].isLogin) {
            NSLog(@"ttttttttttt2");
            [[frameVc.childViewControllers firstObject] presentViewController:[[QLMLoginViewController alloc]init] animated:YES completion:nil];
            NSLog(@"ttttttttttt3");
        }
    });
    
    
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
