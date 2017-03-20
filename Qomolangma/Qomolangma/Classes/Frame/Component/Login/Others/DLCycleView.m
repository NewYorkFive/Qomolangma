//
//  DLCycleView.m
//  图片轮播器
//
//  Created by NowOrNever on 14/01/2017.
//  Copyright © 2017 NowOrNever. All rights reserved.
//



#import "DLCycleView.h"
#import "Masonry.h"
#import "DLCycleFlowLayout.h"
#import "DLCommon.h"
#import "DLCycleCollectionViewCell.h"

#define kSeed 1248


@interface DLCycleView ()<UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, weak) UICollectionView *collectionView;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, weak) UIPageControl *pageControl;
@end

static NSString *cellid = @"cellid";

@implementation DLCycleView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    [self setupUI];
}

- (void)setupUI{
    self.pageControlRatio = 1;
    
    DLCycleFlowLayout *layout = [[DLCycleFlowLayout alloc]init];
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    _collectionView = collectionView;
    [self addSubview:collectionView];
    [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(@0);
    }];
    
    [collectionView registerClass:[DLCycleCollectionViewCell class] forCellWithReuseIdentifier:cellid];
    
    collectionView.dataSource = self;
    collectionView.delegate = self;
    
    collectionView.pagingEnabled = YES;
    
    collectionView.showsVerticalScrollIndicator = NO;
    collectionView.showsHorizontalScrollIndicator = NO;
    
    
    UIPageControl *pageControl = [[UIPageControl alloc]init];
    self.pageControl = pageControl;
    [self addSubview:pageControl];
    pageControl.userInteractionEnabled = NO;
    pageControl.currentPage = 0;
    pageControl.currentPageIndicatorTintColor = (_pageCurrentColor != nil) ? _pageCurrentColor : [UIColor yellowColor];
    pageControl.pageIndicatorTintColor = (_pageBackGroundColor != nil) ? _pageBackGroundColor : [UIColor darkGrayColor];
//    pageControl.currentPageIndicatorTintColor = [UIColor redColor];
//    pageControl.pageIndicatorTintColor =  [UIColor darkGrayColor];
    [pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).offset(-5 + (1 - self.pageControlRatio) * self.bounds.size.height);
        make.centerX.equalTo(self);
    }];
    
    
}

- (void)setPageControlRatio:(CGFloat)pageControlRatio{
    _pageControlRatio = pageControlRatio;
    [self.pageControl mas_updateConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self).offset(-5 - (1 - self.pageControlRatio) * self.bounds.size.height);
    }];
}

- (void)updateTimer{
    [self.collectionView setContentOffset:CGPointMake(self.collectionView.contentOffset.x +self.collectionView.bounds.size.width, 0) animated:YES];
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.imageNames.count * kSeed * 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    DLCycleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellid forIndexPath:indexPath];
    cell.backgroundColor = [UIColor dl_randomColor];
    cell.imageName = self.imageNames[indexPath.row % self.imageNames.count];
    return cell;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offsetX = scrollView.contentOffset.x;
    NSInteger page = (int)( offsetX / scrollView.bounds.size.width + 0.5 ) % self.imageNames.count;
    _pageControl.currentPage = page;
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    [self scrollViewDidEndDecelerating:scrollView];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    self.timer.fireDate = [NSDate distantFuture];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    self.timer.fireDate = [NSDate dateWithTimeIntervalSinceNow:2];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.x == 0) {
        scrollView.contentOffset = CGPointMake(scrollView.bounds.size.width * self.imageNames.count * kSeed , 0);
    }
    if (scrollView.contentOffset.x == scrollView.contentSize.width - scrollView.bounds.size.width) {
        scrollView.contentOffset = CGPointMake(scrollView.bounds.size.width * (self.imageNames.count * kSeed - 1 ), 0);
    }
//    NSInteger page = offsetX /scrollView.bounds.size.width;
//    
//    if (page == 0) {
//        <#statements#>
//    }
}

- (void)setImageNames:(NSArray<NSString *> *)imageNames{
    _imageNames = imageNames;
    _pageControl.numberOfPages = self.imageNames.count;
    [self.collectionView reloadData];
    [self layoutIfNeeded];
    self.collectionView.contentOffset = CGPointMake(self.collectionView.bounds.size.width * self.imageNames.count * kSeed, 0);
    if (!_timer) {
        NSTimer *timer = [NSTimer timerWithTimeInterval:2 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
        _timer = timer;
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
    }
}

//- (void)setImageUrls:(NSArray<NSURL *> *)imageUrls{
////    _imageUrls = imageUrls;
//    _pageControl.numberOfPages = self.imageNames.count;
//    
//    [self.collectionView reloadData];
//    [self layoutIfNeeded];
//    self.collectionView.contentOffset = CGPointMake(self.collectionView.bounds.size.width * self.imageNames.count * kSeed, 0);
//    
////    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
//    //equals
////    _timer = [NSTimer timerWithTimeInterval:2 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
////    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
//    
//    
//    if (!_timer) {
//        NSTimer *timer = [NSTimer timerWithTimeInterval:2 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
//        _timer = timer;
//        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
//
//    }
//}

- (void)setPageCurrentColor:(UIColor *)pageCurrentColor{
    _pageCurrentColor = pageCurrentColor;
    [self layoutIfNeeded];
}

- (void)setPageBackGroundColor:(UIColor *)pageBackGroundColor{
    _pageBackGroundColor = pageBackGroundColor;
    [self layoutIfNeeded];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)dealloc{
//    NSLog(@"Son dead.");
    
}

- (void)removeFromSuperview{
    [self.timer invalidate];
//    NSLog(@"removeFromeSuperView");
}

@end
