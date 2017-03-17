//
//  QLMNavBarView.m
//  Qomolangma
//
//  Created by 刘康 on 2017/3/16.
//  Copyright © 2017年 Focus. All rights reserved.
//

#import "QLMNavBarView.h"
#import "QLMLearnViewController.h"

@interface QLMNavBarView ()

@property (nonatomic, weak) UIButton *selectedBtn;
@property (nonatomic, strong) NSArray <UIButton *>*btsArray;
@property (nonatomic, weak) UIView *redLine;
@end

@implementation QLMNavBarView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupUI];
}

- (void)setupUI {
    //Button
    UIButton *leftButton = [UIButton fcs_textButton:@"已定" fontSize:16 normalColor:[UIColor blackColor] selectedColor:[UIColor redColor]];
    leftButton.selected = YES;
    _selectedBtn = leftButton;
    
    UIButton *rightButton = [UIButton fcs_textButton:@"推荐" fontSize:16 normalColor:[UIColor blackColor] selectedColor:[UIColor redColor]];
    
    self.btsArray = @[leftButton,rightButton];
    [leftButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [rightButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:leftButton];
    [self addSubview:rightButton];
    
    [_btsArray mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
    [_btsArray mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.bottom.equalTo(self);
    }];

    //下划线
    UIView *redLine = [UIView new];
    redLine.backgroundColor = [UIColor redColor];
    [self addSubview:redLine];
    
    [redLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(4);
        make.width.equalTo(_selectedBtn);
        make.bottom.equalTo(self);
        make.centerX.equalTo(_selectedBtn);
    }];
    self.redLine = redLine;
}

//点击导航栏按钮
- (void)click:(UIButton *)sender {
    //MARK: 标记选中
    //1.取消上一次标记按钮的选中
    _selectedBtn.selected = NO;
    
    //2.设置当前选中的按钮选中
    sender.selected = YES;
    
    //3.替换一下标记的按钮
    _selectedBtn = sender;
    
    //MARK:小黄条
    NSInteger index = [_btsArray indexOfObject:sender];
    CGFloat offsetX = index * sender.bounds.size.width;

    [_redLine mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_btsArray[0]).offset(offsetX);
    }];
    //4.动画
    [UIView animateWithDuration:.25 animations:^{
        
        [self layoutIfNeeded];
    }];
    
    //MARK:传递页数 给 控制器
    if([_navBarDelegate respondsToSelector:@selector(navBarView:withPageNumber:)]){
        
        [_navBarDelegate navBarView:self withPageNumber:index];
    }
}

//手动滚动ScrolView 修改小黄条
- (void)setOffsetX:(CGFloat)offsetX {
    
    _offsetX = offsetX;
    
    //MARK:1.更新小黄条的约束
    [_redLine mas_updateConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(_btsArray[0]).offset(offsetX*self.selectedBtn.bounds.size.width/[UIScreen mainScreen].bounds.size.width );
        
    }];
    
    //MARK:2.修改按钮的选中状态
    //1.获取按钮的角标
//    NSInteger index = offsetX/_btsArray[0].bounds.size.width - 0.5;
    
    //2.根据角标设置选中按钮的状态
    
    //取消上一次标记按钮的选中
    _selectedBtn.selected = NO;
    
    //设置当前选中的按钮选中
    _btsArray[_isSelectedPage].selected = YES;
    
    //替换一下标记的按钮
    _selectedBtn = _btsArray[_isSelectedPage];
    
}

/*
//改变选中
- (void)setIsSelectedPage:(BOOL)isSelectedPage {
    _isSelectedPage = isSelectedPage;
    
    if (isSelectedPage) {
        //MARK:1.更新小黄条的约束
        
        [_redLine mas_updateConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.equalTo(_btsArray[0]).offset(_selectedBtn.bounds.size.width);
            
        }];
        //取消上一次标记按钮的选中
        _selectedBtn.selected = NO;
        
        //设置当前选中的按钮选中
        _btsArray[isSelectedPage].selected = YES;
        
        //替换一下标记的按钮
        _selectedBtn = _btsArray[isSelectedPage];
    } else {
        
    }
}
*/
@end
