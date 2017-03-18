//
//  QLMLearnViewController.m
//  Qomolangma
//
//  Created by NowOrNever on 15/03/2017.
//  Copyright © 2017 Focus. All rights reserved.
//

#import "QLMLearnViewController.h"
#import "QLMLearnCollectionViewCell.h"
#import "QLMNavBarView.h"
#import "QLMLearnViewFlowLayout.h"



@interface QLMLearnViewController ()<QLMNavBarViewDelegate,QLMLearnCollectionViewCellDelegate>

@property (nonatomic, strong)QLMNavBarView *learnBarView;

@end

@implementation QLMLearnViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //如果你不想让scrollView的内容自动调整，将这个属性设为NO
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    self.view.backgroundColor = [UIColor blueColor];
    [self.collectionView registerClass:[QLMLearnCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    [self setupUI];
}
- (instancetype)init {
    QLMLearnViewFlowLayout *flowLayout = [[QLMLearnViewFlowLayout alloc] init];
    return [super initWithCollectionViewLayout:flowLayout];
}
- (void)setupUI {
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    // 设置导航栏
    self.navigationController.navigationBar.alpha = 0;
    self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
    //View
    QLMNavBarView *learnBarView = [[QLMNavBarView alloc] initWithFrame:CGRectMake(0, 0, 100, 36)];
    self.navigationItem.titleView = learnBarView;
    self.learnBarView = learnBarView;
    learnBarView.navBarDelegate = self;
    

    self.collectionView.pagingEnabled = YES;
   
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
  
    self.collectionView.bounces = NO;
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        NSLog(@"已定页面的tableView");
    } else {
        NSLog(@"推荐页面的tableView");
    }
    
    QLMLearnCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.learnCellDelegate = self;
    
    return cell;
}

//push
- (void)learnCollectionViewCell:(QLMLearnCollectionViewCell *)learnCollectionViewCell withDetailsTableViewController:(QLMLearnDetailsTableViewController *)detailsTableViewVc WithIndexPath:(NSIndexPath *)indexPath {
//    self.hidesBottomBarWhenPushed=YES; 
    [self.navigationController pushViewController:detailsTableViewVc animated:NO];
    detailsTableViewVc.navigationController.title = [NSString stringWithFormat:@"读古希腊神话学营销"];

    detailsTableViewVc.navigationItem.rightBarButtonItems = @[[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:nil action:nil]];
//    self.hidesBottomBarWhenPushed=NO;
}

//减速完成,实现与navBar的联动
- (void)scrollViewDidScroll:(UICollectionView *)scrollView {
    //MARK:如果是自动的 ,其他操作不执行
    if(!(scrollView.tracking || scrollView.dragging || scrollView.decelerating)){
        
        return;
    }

    // 获取系统的offsetX
    CGFloat offsetX = scrollView.contentOffset.x ;
    
    // 为了方便计算页数在中间需要加上宽度的一半
    CGFloat calcOffsetX = offsetX + scrollView.bounds.size.width * .5;
    
    NSInteger page = calcOffsetX / scrollView.bounds.size.width;
//    NSLog(@"%f -- %zd",offsetX,page);
    // 关联
    self.learnBarView.isSelectedPage = page;
    self.learnBarView.offsetX = offsetX;
    
    
}

//点击按钮,实现滚动
- (void)navBarView:(QLMNavBarView *)navBarView withPageNumber:(NSInteger)pageNumber {
    CGRect rect = CGRectMake(pageNumber *self.view.bounds.size.width, 0, self.collectionView.bounds.size.width, self.collectionView.bounds.size.height);
    [self.collectionView scrollRectToVisible:rect animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}










@end
