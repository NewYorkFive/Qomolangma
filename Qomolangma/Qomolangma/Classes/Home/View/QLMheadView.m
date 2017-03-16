//
//  QLMCarouselView.m
//  Qomolangma
//
//  Created by 张晨晖 on 2017/3/16.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMHeadView.h"
#import "QLMHeadFlowLayout.h"
#import "QLMHeadCell.h"
#import <Masonry.h>

#define kSeed 999

@interface QLMHeadView () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, weak) UICollectionView *collectionView;

@property (nonatomic, weak) UIPageControl *pageControl;

@property (nonatomic, strong) NSTimer *timer;

@end

static NSString *cycleCellid = @"cycleCellid";

@implementation QLMHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]){
        [self setupUI];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self setupUI];
}

- (void)setupUI {
    // collectionView
    QLMHeadFlowLayout *layout = [[QLMHeadFlowLayout alloc] init];
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    [self addSubview:collectionView];
    
    // 设置数据源和代理
    collectionView.delegate = self;
    collectionView.dataSource = self;
    
    // 注册单元格
    [collectionView registerClass:[QLMCarouselCell class] forCellWithReuseIdentifier:cycleCellid];
    
    // 设置分页
    collectionView.pagingEnabled = YES;
    
    // 取消滚动条
    collectionView.showsVerticalScrollIndicator = NO;
    collectionView.showsHorizontalScrollIndicator = NO;
    
    [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
    
    self.collectionView = collectionView;
    
    // 创建pageControl
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.currentPage = 2;
    pageControl.pageIndicatorTintColor = [UIColor blueColor];
    pageControl.currentPageIndicatorTintColor = [UIColor yellowColor];
    pageControl.userInteractionEnabled = NO;
    [self addSubview:pageControl];
    
    [pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.offset(0);
        make.bottom.offset(0);
    }];
    
    self.pageControl = pageControl;
}

- (void)setImageURLs:(NSArray *)imageURLs {
    
    if (_imageURLs) {
        return;
    }
    
    _imageURLs = imageURLs;
    
    // 刷新数据
    [self.collectionView reloadData];
    
    
    // 让屏幕显示中间的cell
    self.collectionView.contentOffset = CGPointMake(self.bounds.size.width * self.imageURLs.count * kSeed, 0);
    
    // 设置pageControl的总页数
    self.pageControl.numberOfPages = imageURLs.count;
    
    // 每 "2" 秒钟 执行 "self" 对象的 "updateTimer" 的方法  "要重复"
    //    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
    
    if (!self.timer) {
        NSTimer *timer = [NSTimer timerWithTimeInterval:2 target:self selector:@selector(updateTimer) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
        self.timer = timer;
    }
    
    // 添加到运行循环的模式
    // NSDefaultRunLoopMode (触摸其他控件的时候 timer不执行) (效率更高, 更高的是默认的)
    // NSRunLoopCommonModes (触摸其他控件的时候 timer执行)
    
}

// 开始拖拽
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    // timer"暂停"
    // 所谓的暂停 实际上就是 把启动的时间改到遥远的未来
    self.timer.fireDate = [NSDate distantFuture];
}

// 结束拖拽
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    // timer继续
    self.timer.fireDate = [NSDate dateWithTimeIntervalSinceNow:2];
}


// timer执行的方法
- (void)updateTimer {
    // 在自身的offsetX的基础上 再加一个宽度
    [self.collectionView setContentOffset:CGPointMake(self.collectionView.contentOffset.x+ self.bounds.size.width, 0) animated:YES];
    
    //  [UIView animateWithDuration:.2 animations:^{
    //     self.collectionView.contentOffset = CGPointMake(self.collectionView.contentOffset.x+ self.bounds.size.width, 0);
    //  }];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.imageURLs.count * 2 * kSeed;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    QLMCarouselCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cycleCellid forIndexPath:indexPath];
    
    cell.imageURL = self.imageURLs[indexPath.item % self.imageURLs.count];
    
    return cell;
}

// scrollView滑动的时候调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // 获取offset
    CGFloat offsetX = scrollView.contentOffset.x;
    // 计算页数
    NSInteger page = (offsetX + self.bounds.size.width * .5) / self.bounds.size.width ;
    
    self.pageControl.currentPage = page % self.imageURLs.count;
    
}

// 系统滚动动画执行完毕的时候会调用
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    [self scrollViewDidEndDecelerating:scrollView];
}

// scrolView(collectionView)手动!!!已经减速完成
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    // 获取offset
    CGFloat offsetX = scrollView.contentOffset.x;
    // 计算页数
    NSInteger page = offsetX / self.bounds.size.width;
    
    //    NSLog(@"%zd", page);
    
    // 获取某一组有多少个item
    NSInteger cellCount = [self.collectionView numberOfItemsInSection:0];
    
    if (page == 0) { // 如果第0页
        self.collectionView.contentOffset = CGPointMake(offsetX + self.imageURLs.count * self.bounds.size.width * kSeed, 0);
    } else if (page == cellCount - 1) { // 最后一页
        self.collectionView.contentOffset = CGPointMake(offsetX - self.imageURLs.count * self.bounds.size.width * kSeed, 0);
    }
    
}

- (void)removeFromSuperview {
    [super removeFromSuperview];
    
    NSLog(@"cycleView - removeFromSuperview");
    
    // 在view移除的时候 就要一定一定一定把timer从运行循环中移除
    [self.timer invalidate];
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
