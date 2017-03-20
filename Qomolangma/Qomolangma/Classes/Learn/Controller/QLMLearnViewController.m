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
#import "QLMLearnFirstCellModel.h"
#define BARVIEWWIDTH 160
#define BARVIEWHEIGHT 36
@interface QLMLearnViewController ()<QLMNavBarViewDelegate,QLMLearnCollectionViewCellDelegate>

@property (nonatomic, strong)UICollectionView *collectionView;

@property (nonatomic, strong)QLMNavBarView *learnBarView;

@property (nonatomic, strong) NSArray<QLMLearnFirstCellModel *> *firstCellModelArray;

@end

@implementation QLMLearnViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)loadView{
    QLMLearnViewFlowLayout *flowLayout = [[QLMLearnViewFlowLayout alloc] init];
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, kNavBarHeight, kScreenWidth, kScreenHeight - kNavBarHeight) collectionViewLayout:flowLayout];
    self.view = self.collectionView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];

    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    
    //不让内容自动调整
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.view.backgroundColor = [UIColor blueColor];
    [self.collectionView registerClass:[QLMLearnCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    [self setupUI];
}

- (void)setupUI {
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    // 设置导航栏
    self.navigationController.navigationBar.alpha = 0;
    self.navigationController.navigationBar.backgroundColor = [UIColor whiteColor];
    //View
    QLMNavBarView *learnBarView = [[QLMNavBarView alloc] initWithFrame:CGRectMake(0, 0, BARVIEWWIDTH, BARVIEWHEIGHT)];
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

    QLMLearnCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
//    cell.learnCellDelegate = self;
    cell.block = ^(QLMLearnDetailsTableViewController *vc){
        [self.navigationController pushViewController:vc animated:YES];
        vc.navigationItem.rightBarButtonItems = @[[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:nil action:nil]];
    };
    return cell;
}

//push
- (void)learnCollectionViewCell:(QLMLearnCollectionViewCell *)learnCollectionViewCell withDetailsTableViewController:(QLMLearnDetailsTableViewController *)detailsTableViewVc WithIndexPath:(NSIndexPath *)indexPath {

    [self.navigationController pushViewController:detailsTableViewVc animated:YES];

    detailsTableViewVc.navigationItem.rightBarButtonItems = @[[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:nil action:nil]];
//    detailsTableViewVc.firstCellModelArray = self.firstCellModelArray;
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


- (void)loadData{
    [[QLMNetworkTools sharedTools] requestWithType:GET andUrlStr:@"app/resource/getSubscribeList" andParams:nil andSuccess:^(id responseObject) {
        NSArray *array = ((NSDictionary *)responseObject)[@"data"];
        NSMutableArray<QLMLearnFirstCellModel *> *mArr = [NSMutableArray array];
        for (int i = 0; i < array.count; i++) {
            [mArr addObject:[QLMLearnFirstCellModel yy_modelWithDictionary:array[i]]];
        }
        self.firstCellModelArray = mArr.copy;
        [self.collectionView reloadData];
    } andFailture:^(NSError *error) {
        NSLog(@"Error:%@",error);
    }];
}






@end
