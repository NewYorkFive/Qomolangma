//
//  QLMMineAboutDeveloperController.m
//  Qomolangma
//
//  Created by Aioria on 2017/3/20.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMMineAboutDeveloperController.h"
#import "QLMMineEmitterLayer.h"
#import "QLMMineParticle.h"
#import <CoreMotion/CoreMotion.h>

@interface QLMMineAboutDeveloperController () <QLMMineEmitterLayerDelegate, UIAccelerometerDelegate>

@property (nonatomic, strong)UILabel *labTeamName;

@property (nonatomic, strong)UILabel *labSlogan;

@property (nonatomic, strong)UILabel *labGitHub;

@property (nonatomic , strong) UIDynamicAnimator        * animator;
@property (nonatomic , strong) UIGravityBehavior        * gravityBehavior;
@property (nonatomic , strong) UICollisionBehavior      * collisionBehavitor;
@property (nonatomic , strong) UIDynamicItemBehavior    * itemBehavitor;
@property (nonatomic, strong)  CMMotionManager * motionMManager;
@property (strong,nonatomic)   NSMutableArray *dropsArray;
@property (strong,nonatomic) UIImageView *leftShoot;
@property (strong,nonatomic) UIImageView *rightShoot;

@property (strong,nonatomic) UIView *giftView;


@property (nonatomic, strong) dispatch_source_t timer;


@property (assign,nonatomic) BOOL isDropping;

@property (assign,nonatomic) int page;

@end

@implementation QLMMineAboutDeveloperController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])
    {
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];

    [_motionMManager stopAccelerometerUpdates];
    _isDropping = NO;
    if (_timer) {
        dispatch_cancel(_timer);
        _timer = nil;
    }
    for (UIDynamicBehavior *behavior in _animator.behaviors)
    {
        if (behavior == self.gravityBehavior)
        {
            for (UIImageView *v in self.gravityBehavior.items)
            {
                [self.gravityBehavior removeItem:v];
                if (v.superview)[v removeFromSuperview];
            }
            continue;
        }
        else if (behavior == self.collisionBehavitor)
        {
            for (UIImageView *v in self.collisionBehavitor.items) {
                [self.collisionBehavitor removeItem:v];
                if (v.superview)[v removeFromSuperview];
            }
            continue;
        }
        else [_animator removeBehavior:behavior];;
    }
    self.animator = nil;
    [self.dropsArray removeAllObjects];

}

- (void)setupUI
{
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    UIImage* image = [UIImage imageNamed:@"AppIcon98x98"];//qcloud.jpg|timg.jpeg|qq.png|tiger.jpg
    
    QLMMineEmitterLayer *emitterLayer = [QLMMineEmitterLayer new];
    emitterLayer.bounds = self.view.bounds;
    emitterLayer.position = self.view.center;
    emitterLayer.beginPoint = CGPointMake(self.view.center.x, 50);
    emitterLayer.ignoredWhite = YES;
    emitterLayer.image = image;
    emitterLayer.mineEmitterLayerdelegate = self;
    [self.view.layer addSublayer:emitterLayer];
    
    self.labTeamName = [UILabel fcs_labelWithColor:[UIColor orangeColor] andFontSize:35 andText:@"F O C U S"];
    
    self.labTeamName.alpha = 0;
    
    [self.view addSubview:self.labTeamName];
    
    [self.labTeamName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuideBottom).offset(60);
        make.centerX.offset(0);
        
    }];
    
    self.labSlogan = [UILabel fcs_labelWithColor:[UIColor colorWithRed:5 / 255.0 green:123 / 255.0 blue:1 alpha:1] andFontSize:13 andText:@"Just do IT"];
    
    self.labSlogan.alpha = 0;
    
    [self.view addSubview:self.labSlogan];
    
    [self.labSlogan mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.labTeamName.mas_bottom).offset(20);
        make.centerX.offset(0);
    }];
    
    self.labGitHub = [UILabel fcs_labelWithColor:[UIColor colorWithRed:5 / 255.0 green:123 / 255.0 blue:1 alpha:1] andFontSize:13 andText:@"https://github.com/FocusTheOne/Qomolangma.git"];

    self.labGitHub.alpha = 0;
    
    [self.view addSubview:self.labGitHub];

    
    [self.labGitHub mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset(-80);
        make.centerX.offset(0);
    }];
    
    
    _giftView =[[UIView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_giftView];
    
    
    
}

- (void)mineEmitterLayerAnimEnd
{
    [UIView animateWithDuration:1.5 animations:^{
        self.labTeamName.alpha = 1;
        self.labSlogan.alpha = 1;
        self.labGitHub.alpha = 1;
    }completion:^(BOOL finished) {
        [self addSerialDrop];
    }];
}

-(void)addSerialDrop{
    [self startMotion];
    UIImage *love = [UIImage imageNamed:@"love"];
    UIImage *star = [UIImage imageNamed:@"star"];
    if (self.dropsArray.count % 2 == 0) {
        [self dropWithCount:30 images:@[love]];
    }else{
        [self dropWithCount:30 images:@[star]];
    }
    
    [self serialDrop];
}

-(void)serialDrop{
    if (_isDropping) return;
    _isDropping = YES;
    dispatch_queue_t queue = dispatch_get_main_queue();
    self.timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_time_t start = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC));/**< 延迟一秒执行*/
    uint64_t interval = (uint64_t)(0.05 * NSEC_PER_SEC);
    dispatch_source_set_timer(self.timer, start, interval, 0);
    // 设置回调
    dispatch_source_set_event_handler(self.timer, ^{
        if (self.dropsArray.count == 0) return;
        NSMutableArray *currentDrops = self.dropsArray[0];
        
        if ([currentDrops count]) {
            if (currentDrops.count == 0) return;
            UIImageView * dropView = currentDrops[0];
            [currentDrops removeObjectAtIndex:0];
            [self.giftView addSubview:dropView];
            UIPushBehavior *pushBehavior = [[UIPushBehavior alloc] initWithItems:@[dropView] mode:UIPushBehaviorModeInstantaneous];
            [self.animator addBehavior:pushBehavior];
            //角度范围 ［0.6 1.0］
            float random = ((int)(2 + (arc4random() % (10 - 4 + 1))))*0.1;
            
            pushBehavior.pushDirection = CGVectorMake(0.6,random);
            if (dropView.tag != 11) {
                pushBehavior.pushDirection = CGVectorMake(-0.6,random);
            }
            
            pushBehavior.magnitude = 0.3;
            [self.gravityBehavior addItem:dropView];
            [self.collisionBehavitor addItem:dropView];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                dropView.alpha = 0;
                [self.gravityBehavior removeItem:dropView];
                [self.collisionBehavitor removeItem:dropView];
                [pushBehavior removeItem:dropView];
                [self.animator removeBehavior:pushBehavior];
                [dropView removeFromSuperview];
            });
            
        }else{
            dispatch_source_cancel(self.timer);
            [self.dropsArray removeObject:currentDrops];
            _isDropping = NO;
            if (self.dropsArray.count) {
                [self serialDrop];
            }
        }
        
    });
    dispatch_source_set_cancel_handler(_timer, ^{
        
    });
    //启动
    dispatch_resume(self.timer);
    
}


#pragma mark instance methods
- (void)startMotion
{
    
    if(_motionMManager.accelerometerAvailable)
    {
        if (!_motionMManager.accelerometerActive)
        {
            _motionMManager.accelerometerUpdateInterval = 1.0/3.0;
            __unsafe_unretained typeof(self) weakSelf = self;
            [_motionMManager
             startAccelerometerUpdatesToQueue:[[NSOperationQueue alloc] init]
             withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
                 
                 if (error)
                 {
                     NSLog(@"CoreMotion Error : %@",error);
                     [_motionMManager stopAccelerometerUpdates];
                 }
                 CGFloat a = accelerometerData.acceleration.x;
                 CGFloat b = accelerometerData.acceleration.y;
                 CGVector gravityDirection = CGVectorMake(a,-b);
                 weakSelf.gravityBehavior.gravityDirection = gravityDirection;
             }];
        }
        
    }
    else
    {
        NSLog(@"The accelerometer is unavailable");
    }
}

- (NSMutableArray *)dropWithCount:(int)count images:(NSArray *)images
{
    NSMutableArray *viewArray = [[NSMutableArray alloc] init];
    for (int i = 0 ; i < count; i++) {
        
        UIImage *image = [images objectAtIndex:rand()%[images count]];
        UIImageView * imageView =[[UIImageView alloc ]initWithImage:image];
        imageView.contentMode = UIViewContentModeCenter;
        imageView.center = CGPointMake(50, 100);
        imageView.tag = 11;
        if (i%2 == 0) {
            imageView.center = CGPointMake(kScreenWidth - 50, 100);
            imageView.tag = 22;
        }
        [viewArray addObject:imageView];
    }
    [self.dropsArray addObject:viewArray];
    return _dropsArray;
    
}

- (UIDynamicAnimator *)animator{
    if (!_animator) {
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:_giftView];
        /** 重力效果*/
        self.gravityBehavior = [[UIGravityBehavior alloc] init];
        
        /** 碰撞效果*/
        self.collisionBehavitor = [[UICollisionBehavior alloc] init];
        [self.collisionBehavitor setTranslatesReferenceBoundsIntoBoundary:YES];
        [_animator addBehavior:self.gravityBehavior];
        [_animator addBehavior:self.collisionBehavitor];
    }
    
    return _animator;
}

-(NSMutableArray *)dropsArray{
    if (nil == _dropsArray) {
        _dropsArray = [NSMutableArray array];
    }
    return _dropsArray;
}






@end
