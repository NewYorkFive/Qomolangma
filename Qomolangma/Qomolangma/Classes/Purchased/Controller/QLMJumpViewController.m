//
//  QLMJ/Users/wanghuiping/Downloads/毛玻璃效果/毛玻璃效果/对图片处理的扩展类/UIImage+ImageEffects.humpViewController.m
//  Qomolangma
//
//  Created by 王惠平 on 2017/3/18.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMJumpViewController.h"
#import "STAlertView.h"
#import "UIImage+ImageEffects.h"
#import "JinnPopMenu.h"
#import "QLMHtmlViewController.h"

#define COLOR_ITEM [UIColor blackColor]
#define COLOR_ITEM_SELECTED [UIColor yellowColor]
#define COLOR_BACKGROUND [UIColor blackColor]


#define BASE_TAG 10000

@interface QLMJumpViewController () <JinnPopMenuDelegate>

@property (nonatomic,assign) NSInteger index;

@property (nonatomic,strong) UIImageView *imageView;

@property (nonatomic,strong) UIImageView *backImageView;

@property (nonatomic, strong) NSArray *titles;

@property (nonatomic, strong) NSArray *images;

@property (nonatomic,strong) UIWebView *webView;

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
    UITapGestureRecognizer *gr = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(swipeClick:)];
    
    [self.view addGestureRecognizer:gr];
  
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(click)];
    
    self.navigationController.navigationBar.tintColor = [UIColor grayColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(AddClick)];
    
}

- (void)swipeClick:(UISwipeGestureRecognizer *)sender {
    
    _index++;
    
    if (_index == 3) {
        
        //增加毛玻璃效果
        self.backImageView = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        
        UIImage *image = [UIImage imageNamed:@"f9391e488f66457aa227ac634c9b246e_th.jpg"];
        
        UIImage *lastImage = [image applyDarkEffect];
        
        self.backImageView.image = lastImage;
        self.backImageView.userInteractionEnabled = YES;
        
        [self.view addSubview:self.backImageView];
        
        NSString *title = @"通知";
        NSString *message = @"您的手机已经欠费，速交！";
        
        [STAlertView showTitle:title
                         image:nil
                       message:message
                  buttonTitles:@[@"这就去",@"就不交"]
                       handler:^(NSInteger index) {
                           
                           [self click];
                       }];

    }
    
    //2.根据角标设置图片
    NSString *imageName = [NSString stringWithFormat:@"%zd",_index+1];
    self.imageView.image = [UIImage imageNamed:imageName];
    
    //3.转场动画
    //3.1创建动画对象
    CATransition *transition = [CATransition animation];
    
    //3.2设置属性
    //动画的样式 左右翻转
    transition.type = @"pageCurl";
    
    //动画持续时间
    transition.duration = 1;
    
    //3.3添加
    [self.imageView.layer addAnimation:transition forKey:@"transition"];
    
}

- (void)click {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)setup
{
    self.titles = @[ @"编辑", @"信息", @"搜索", @"分享"];
    self.images = @[ @"edit", @"message", @"search", @"share"];
}

- (void)AddClick {
    
    [self setup];
    [self segmentedContolButtonClicked];
    
}

- (void)segmentedContolButtonClicked
{
    NSMutableArray *items = [[NSMutableArray alloc] init];
    for (int i = 0; i < self.titles.count; i++)
    {
        JinnPopMenuItem *popMenuItem = [[JinnPopMenuItem alloc] initWithTitle:self.titles[i]
                                                                   titleColor:COLOR_ITEM
                                                                selectedTitle:self.titles[i]
                                                           selectedTitleColor:COLOR_ITEM_SELECTED
                                                                         icon:[self imageVithColor:COLOR_ITEM image:[UIImage imageNamed:self.images[i]]]
                                                                 selectedIcon:[self imageVithColor:COLOR_ITEM_SELECTED image:[UIImage imageNamed:self.images[i]]]];
        [items addObject:popMenuItem];
    }
    
    JinnPopMenu *popMenu = [[JinnPopMenu alloc] initWithPopMenus:[items copy]];
    
    
    UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ocean"]];
    [popMenu setMode:JinnPopMenuModeSegmentedControl];
    [popMenu setShouldHideWhenBackgroundTapped:YES];
    popMenu.backgroundView = image;
    [popMenu setDelegate:self];
    [popMenu setTag:BASE_TAG];
    [self.view addSubview:popMenu];
    [popMenu showAnimated:YES];
    [popMenu selectItemAtIndex:0];
    [popMenu mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.equalTo(self.view);
    }];
}

#pragma mark - JinnPopViewDelegate
- (void)itemSelectedAtIndex:(NSInteger)index popMenu:(JinnPopMenu *)popMenu
{
    
    if (popMenu.tag != BASE_TAG)
    {
        [popMenu dismissAnimated:NO];
    }
}


//修改图片颜色
- (UIImage *)imageVithColor:(UIColor *)color image:(UIImage *)image
{
    UIGraphicsBeginImageContextWithOptions(image.size, NO, image.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0, image.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGRect rect = CGRectMake(0, 0, image.size.width, image.size.height);
    CGContextClipToMask(context, rect, image.CGImage);
    [color setFill];
    CGContextFillRect(context, rect);
    UIImage*newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
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
