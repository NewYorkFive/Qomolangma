//
//  QLMLearnDetailsTableViewController.m
//  Qomolangma
//
//  Created by 刘康 on 2017/3/17.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMLearnDetailsTableViewController.h"
#import "QLMLearnBottomButtonView.h"
#import "QLMPresntViewController.h"
#import "QLMLearnDetailTableViewCell.h"
#import "QLMLearnViewController.h"

#define  NAVBARHEIGHT 64
#define TOPVIEWHEIGHT 123
#define BACK_GROUND_IMAGE_VIEW_HEIGHT 200

@interface QLMLearnDetailsTableViewController ()<UITableViewDataSource,UITableViewDelegate,QLMLearnBottomButtonViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIImageView *backgroundImageVeiw;
@property (nonatomic, strong) UIView *frontView;
@property (nonatomic, strong) UIImageView *headerImgView;
@property (nonatomic, strong) UILabel *lastEditionLabel;
@property (nonatomic, strong) UILabel *lastTipLabel;

@end

@implementation QLMLearnDetailsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self loadData];
    
    [self setupUI];

}


- (instancetype)init{
    if (self = [super init]) {
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
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
    [self.tableView registerClass:[QLMLearnDetailTableViewCell class] forCellReuseIdentifier:@"detailsCell"];
    //预估行高
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 300;
    
    //改变tableView 内容显示的位置 应该是在 图片的下面开始 设置内边距
    self.tableView.contentInset = UIEdgeInsetsMake(200, 0, 0, 0);
    
    self.tableView.showsVerticalScrollIndicator = NO;
    
    //去掉多余的分割线
    self.tableView.tableFooterView = [[UIView alloc] init];
   /*
    //tableHeaderView
    
    UIImageView *headerImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"userinfo_top_bg"]];
//    headerImgView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200);
    self.headerImgView = headerImgView;
    [self.tableView.tableHeaderView addSubview:headerImgView];
    [headerImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.tableView);
        make.height.offset(BACK_GROUND_IMAGE_VIEW_HEIGHT);
    }];

    
    [_headerImgView sizeToFit];
    */
    self.navigationController.navigationBar.alpha = 0;
    
    //底部的view
    QLMLearnBottomButtonView *frontView = [[QLMLearnBottomButtonView alloc] initWithFrame:CGRectZero];
    self.frontView = frontView;
    self.frontView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.frontView];
    [self.frontView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.offset(0);
        make.height.offset(40);
    }];
    
    frontView.testReadDelegate = self;
    
    
    
}

//push
- (void)learnBottomButtonView:(QLMLearnBottomButtonView *)learnBottomButtonView withTestReadTableViewController:(QLMTestReadTableViewController *)testReadTableViewController {
    testReadTableViewController.model = self.model;
    UIBarButtonItem *backItem=[[UIBarButtonItem alloc] init];
    backItem.title = self.model.name;

    self.navigationItem.backBarButtonItem = backItem;
    [self.navigationController pushViewController:testReadTableViewController animated:YES];
}
- (void)learnBottomButtonView:(QLMLearnBottomButtonView *)learnBottomButtonView withPresntViewController:(QLMLearnModelViewController *)presntViewController {
    [self presentViewController:presntViewController animated:YES completion:nil];
}

- (UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        
        _tableView.backgroundColor = [UIColor clearColor];
        
        [self.view addSubview:_tableView];
        
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_topLayoutGuide);
            make.left.right.offset(0);
            make.bottom.equalTo(self.mas_bottomLayoutGuide).offset(-40);
        }];
    }
    return _tableView;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = self.tableView.contentOffset.y;
    if (offsetY < -200)
    {
        [self.backgroundImageVeiw mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.offset(BACK_GROUND_IMAGE_VIEW_HEIGHT - (offsetY - 200) * .5);
        }];
        /*
        //设置高度
        CGFloat h = _headerImgView.frame.size.height;
       
        [_headerImgView sizeToFit];
        //改变headerView的高度
        CGRect newFrame = self.tableView.tableHeaderView.frame;
        newFrame.size.height = newFrame.size.height - (offsetY-200);
        self.tableView.tableHeaderView.frame = newFrame;
        [self.tableView beginUpdates];
        [self.tableView setTableHeaderView:self.tableView.tableHeaderView];
        [self.tableView endUpdates];
        */
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
    QLMLearnDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"detailsCell" forIndexPath:indexPath];
    
    if (indexPath.row <= 2) {
        UILabel *columnIntroduceLabel;
        UILabel *readerCountLabel;
        UILabel *columnTextLabel;
        if (indexPath.row == 0) {
            //第一个cell 添加控件
            columnIntroduceLabel = [UILabel fcs_labelWithColor:[UIColor blackColor] andFontSize:16 andText:@"专栏简介"];
            readerCountLabel = [UILabel fcs_labelWithColor:[UIColor lightGrayColor] andFontSize:12 andText:@"1人订阅"];
            columnTextLabel = [UILabel fcs_labelWithColor:[UIColor grayColor] andFontSize:12 andText:@"<<新战略营销>> 学习如何制定营销战略目标  <<How Brands Grow>> 教创业者如何实践正确的营销理念  <<疯传: 让你的产品, 思想, 行为像病毒一样入侵>> 教创业者如何打造传播力 <<新战略营销>> 学习如何制定营销战略目标  <<How Brands Grow>> 教创业者如何实践正确的营销理念  <<疯传: 让你的产品, 思想, 行为像病毒一样入侵>> 教创业者如何打造传播力 <<新战略营销>> 学习如何制定营销战略目标  <<How Brands Grow>> 教创业者如何实践正确的营销理念  <<疯传: 让你的产品, 思想, 行为像病毒一样入侵>> 教创业者如何打造传播力"];
        } else if (indexPath.row == 1) {
            //第二个cell 添加控件
            columnIntroduceLabel = [UILabel fcs_labelWithColor:[UIColor blackColor] andFontSize:16 andText:@"适宜人群"];
            readerCountLabel = [UILabel fcs_labelWithColor:[UIColor lightGrayColor] andFontSize:12 andText:@""];
            columnTextLabel = [UILabel fcs_labelWithColor:[UIColor grayColor] andFontSize:12 andText:@"对古希腊神话感兴趣的人群,对产品营销有需求的创业者以及企业家.希望做好产品,学习营销之道的职场从业者."];
        } else if (indexPath.row == 2) {
            //第三个cell 添加控件
            columnIntroduceLabel = [UILabel fcs_labelWithColor:[UIColor blackColor] andFontSize:16 andText:@"订阅须知"];
            readerCountLabel = [UILabel fcs_labelWithColor:[UIColor lightGrayColor] andFontSize:12 andText:@""];
            columnTextLabel = [UILabel fcs_labelWithColor:[UIColor grayColor] andFontSize:12 andText:@"1.第一季共讲12本营销书籍,共17期,每期30分钟左右(每周更新三期) 2.本课程为虚拟服务,订阅成功后概不退款,请您理解. 3.版权归原作者所有,严禁翻录成任何形式,严禁在任何第三方平台传播,违者将追究其法律责任"];
        }
        
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
        }];
    } else if (indexPath.row == 3) {
        
        //添加控件
        UILabel *lastUpdateLabel = [UILabel fcs_labelWithColor:[UIColor blackColor] andFontSize:12 andText:@"最近更新"];
        UILabel *lastEditionLabel = [UILabel fcs_labelWithColor:[UIColor blackColor] andFontSize:10 andText:@"3.01 读古希腊神话学营销 | 客户的心思猜不透?反其道而行之"];
        self.lastEditionLabel = lastEditionLabel;
        UILabel *lastTimeLabel = [UILabel fcs_labelWithColor:[UIColor lightGrayColor] andFontSize:10 andText:@"2017-03-15"];
        UILabel *lastTipLabel = [UILabel fcs_labelWithColor:[UIColor lightGrayColor] andFontSize:10 andText:@"别人还在养跟快的马的时候,福特已经开始造车了!"];
        self.lastTipLabel = lastTipLabel;
        self.model = self.model;
        [cell.contentView addSubview:lastUpdateLabel];
        [cell.contentView addSubview:lastEditionLabel];
        [cell.contentView addSubview:lastTimeLabel];
        [cell.contentView addSubview:lastTipLabel];
        
        [lastUpdateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.offset(10);
        }];
        [lastEditionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(cell.contentView).offset(10);
            make.right.equalTo(cell.contentView).offset(-10);
            make.top.equalTo(lastUpdateLabel.mas_bottom).offset(10);
        }];
        [lastTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(lastEditionLabel);
            make.top.equalTo(lastEditionLabel.mas_bottom).offset(10);
        }];
        [lastTipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(lastEditionLabel);
            make.top.equalTo(lastTimeLabel.mas_bottom).offset(10);
            make.bottom.equalTo(cell.contentView).offset(-10);
        }];
    }
    return cell;
}

//模型数据添加到控件
- (void)setModel:(QLMLearnFirstCellModel *)model{
    _model = model;
    
    self.lastEditionLabel.text = [NSString stringWithFormat:@"3.01 %@ | %@ | %@",model.name,model.author,model.person_info];
    self.lastTipLabel.text = model.content;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}


@end
