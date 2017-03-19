//
//  QLMJumpViewController.m
//  Qomolangma
//
//  Created by 王惠平 on 2017/3/18.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMJumpViewController.h"

@interface QLMJumpViewController ()

@property (nonatomic,assign) NSInteger index;

@property (nonatomic,strong) UIImageView *imageView;

@end

@implementation QLMJumpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //创建imgview
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, self.view.frame.size.height)];
   
    NSString *imageName = [NSString stringWithFormat:@"%zd",1];
    imageView.image = [UIImage imageNamed:imageName];
    
    self.imageView = imageView;
   
    [self.view addSubview:imageView];
    
    //创建手势
    UITapGestureRecognizer *gre = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(swipeClick:)];
    
    gre.numberOfTapsRequired = 1;
    
    [self.view addGestureRecognizer:gre];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(click)];
    
}

- (void)swipeClick:(UISwipeGestureRecognizer *)sender {
    
    
//    //动画方向
//    NSString *subTypeStr = @"";
//    
//    if(sender.direction == UISwipeGestureRecognizerDirectionRight){
//        
//        _index++;
//        //方向
//        subTypeStr = @"fromLeft";
//        
//    }else if (sender.direction == UISwipeGestureRecognizerDirectionLeft){
//        
//        _index--;
//        //方向
//        subTypeStr = @"fromRight";
//    }
//    
//    //判断图片的范围
//    if(_index > 6){
//        
//        _index = 1;
//        
//    }else if (_index < 1){
//        
//        _index = 6;
//    }
//
    _index++;
    
    //2.根据角标设置图片
    NSString *imageName = [NSString stringWithFormat:@"%zd",_index];
    self.imageView.image = [UIImage imageNamed:imageName];
    
    
    //3.转场动画
    //3.1创建动画对象
    CATransition *transition = [CATransition animation];
    
    //3.2设置属性
    //动画的样式 左右翻转
    //    transition.type = @"oglFlip";
    transition.type = @"cube";
    
    //动画持续时间
    transition.duration = 2;
    
    //动画的方向
//    transition.subtype = subTypeStr;
    
    //3.3添加
    [self.imageView.layer addAnimation:transition forKey:@"transition"];
    
}

- (void)click {
    
    [self dismissViewControllerAnimated:YES completion:nil];
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
