//
//  QLMLearnDetailsTableViewController.m
//  Qomolangma
//
//  Created by 刘康 on 2017/3/17.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMLearnDetailsTableViewController.h"
#define  NAVBARHEIGHT 64
#define TOPVIEWHEIGHT 123
#define BACK_GROUND_IMAGE_VIEW_HEIGHT 200

@interface QLMLearnDetailsTableViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIImageView *backgroundImageVeiw;
@end

@implementation QLMLearnDetailsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self setupUI];

}

- (void)setupUI {
    //backgroundImageVeiw
    self.backgroundImageVeiw = [[UIImageView alloc] init];
    self.backgroundImageVeiw.image = [UIImage imageNamed:@"userinfo_top_bg"];
    self.backgroundImageVeiw.contentMode = UIViewContentModeScaleAspectFill;
    
    [self.view addSubview:self.backgroundImageVeiw];
    
    [self.backgroundImageVeiw mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.offset(0);
        make.height.offset(BACK_GROUND_IMAGE_VIEW_HEIGHT);
    }];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"detailsCell"];
    //预估行高
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 300;
    
    //改变tableView 内容显示的位置 应该是在 图片的下面开始 设置内边距
    self.tableView.contentInset = UIEdgeInsetsMake(200, 0, 0, 0);
    
    self.tableView.showsVerticalScrollIndicator = NO;
    
    //去掉多余的分割线
    self.tableView.tableFooterView = [[UIView alloc] init];
    
    self.navigationController.navigationBar.alpha = 0;
}

- (UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        
//        _tableView.separatorColor = [UIColor colorWithWhite:.9 alpha:1];
        
        _tableView.backgroundColor = [UIColor clearColor];
        
        [self.view addSubview:_tableView];
        
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_topLayoutGuide);
            make.left.right.offset(0);
            make.bottom.equalTo(self.mas_bottomLayoutGuide);
        }];
    }
    return _tableView;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = self.tableView.contentOffset.y;
//    NSLog(@"%f",offsetY);
    
    if (offsetY < -200)
    {
        [self.backgroundImageVeiw mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.offset(BACK_GROUND_IMAGE_VIEW_HEIGHT - (offsetY - 200) * .5);
        }];
    } else {
//        self.backgroundImageVeiw.frame.origin.y = - (offsetY + 200);
//        self.backgroundImageVeiw.layer.transform = CATransform3DTranslate(self.backgroundImageVeiw.layer.transform, 0, - (offsetY + 200), 0);
    }
    //导航栏透明度

    if (offsetY > -200) {
        self.navigationController.navigationBar.alpha = 100/ABS(offsetY);
    } else {
        self.navigationController.navigationBar.alpha = 0;
    }

}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"detailsCell" forIndexPath:indexPath];
    
    if (indexPath.row <= 2) {
        //第一个cell 添加控件
        UILabel *columnIntroduceLabel = [UILabel fcs_labelWithColor:[UIColor blackColor] andFontSize:16 andText:@"专栏简介"];
        UILabel *readerCountLabel = [UILabel fcs_labelWithColor:[UIColor lightGrayColor] andFontSize:12 andText:@"1人订阅"];
        UILabel *columnTextLabel = [UILabel fcs_labelWithColor:[UIColor grayColor] andFontSize:12 andText:@"<<新战略营销>> 学习如何制定营销战略目标  <<How Brands Grow>> 教创业者如何实践正确的营销理念  <<疯传: 让你的产品, 思想, 行为像病毒一样入侵>> 教创业者如何打造传播力 <<新战略营销>> 学习如何制定营销战略目标  <<How Brands Grow>> 教创业者如何实践正确的营销理念  <<疯传: 让你的产品, 思想, 行为像病毒一样入侵>> 教创业者如何打造传播力 <<新战略营销>> 学习如何制定营销战略目标  <<How Brands Grow>> 教创业者如何实践正确的营销理念  <<疯传: 让你的产品, 思想, 行为像病毒一样入侵>> 教创业者如何打造传播力"];
        columnTextLabel.numberOfLines = 0;
        [cell.contentView addSubview:columnIntroduceLabel];
        [cell.contentView addSubview:readerCountLabel];
        [cell.contentView addSubview:columnTextLabel];
        
        [columnIntroduceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.offset(10);
        }];
        [readerCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(columnIntroduceLabel);
            make.right.equalTo(cell.mas_right).offset(-10);
        }];
        [columnTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(columnIntroduceLabel.mas_bottom).offset(10);
            make.left.equalTo(cell.contentView).offset(10);
            make.right.equalTo(cell.contentView).offset(-10);
            make.bottom.equalTo(cell.contentView).offset(-10);
//            make.bottom.lessThanOrEqualTo(@(-4));
//            make.height.greaterThanOrEqualTo(@80);
        }];
    } else if (indexPath.row == 3) {
        
    }
    
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}


@end
