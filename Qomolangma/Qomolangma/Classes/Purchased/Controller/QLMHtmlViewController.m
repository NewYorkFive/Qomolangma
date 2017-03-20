//
//  QLMHtmlViewController.m
//  Qomolangma
//
//  Created by 王惠平 on 2017/3/20.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMHtmlViewController.h"

@interface QLMHtmlViewController ()<UIWebViewDelegate>

@property (nonatomic,strong) UIWebView *webView;

@end

@implementation QLMHtmlViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
   
//    self.view.backgroundColor = [UIColor redColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(click)];
    
    self.navigationController.navigationBar.tintColor = [UIColor grayColor];
   
 
        [self requestHTML];
}
    
    - (void)requestHTML {
        //  指定请求地址
        NSURL *url = [NSURL URLWithString:@"https://book.douban.com"];
        //  请求对象
        NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
        self.webView.delegate = self;
        [self.webView loadRequest:urlRequest];
        self.webView.frame = [UIScreen mainScreen].bounds;
        [self.view addSubview:self.webView];
        
    }
    
#pragma mark -- UIWebViewDelegate
    //  将要加载请求
    - (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
        //  js不是直接调用oc代码,使用js添加第一个点击事件,点击按钮去加载指定路径,然后在oc的将要加载请求的方法里面捕获你请求的地址, 判断其是否是你需要处理的一个地址
        NSLog(@">>url: %@", request.URL.absoluteString);
        if ([request.URL.absoluteString isEqualToString:@"itcast://www.baidu.com"]) {
            //  不去加载请求, 弹出控制器
           
            return NO;
        }
        //  表示去加载请求
        return YES;
    }
    //  已经开始加载请求
    - (void)webViewDidStartLoad:(UIWebView *)webView {
        
    }
    //  请求加载完成
    - (void)webViewDidFinishLoad:(UIWebView *)webView {
        //  表示html数据已经获取到,那么可以执行js代码
        NSMutableString *jsStr = [NSMutableString string];
        //  删除标签的逻辑
        /*
         1. 先找到标签
         2. 找到标签的父标签
         3. 通过父标签删除子标签
         */
        [jsStr appendString:@"var header = document.getElementsByTagName('header')[0]; header.parentNode.removeChild(header);"];
        [jsStr appendString:@"var btn = document.getElementsByClassName('footer-btn-fix')[0]; btn.parentNode.removeChild(btn);"];
        [jsStr appendString:@"var footer = document.getElementsByClassName('footer')[0]; footer.parentNode.removeChild(footer);"];
        //  添加点击事件
        [jsStr appendString:@"var swipe = document.getElementsByClassName('swipe-wrap')[0]; var pic = swipe.children[0]; pic.onclick = function show() {window.location.href = 'itcast://www.baidu.com'};"];
        //  使用web执行js代码
        [webView stringByEvaluatingJavaScriptFromString:jsStr];
    }
    //  请求加载失败
    - (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
        
    }


- (void)click {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end




