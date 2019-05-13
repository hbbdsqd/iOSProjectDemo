//
//  QDBaseHeaderChooseView.m
//  QDBaseProject
//
//  Created by 苏秋东 on 2018/6/19.
//  Copyright © 2018年 苏秋东. All rights reserved.
//

#import "QDBaseHeaderChooseView.h"
#define ScreenWidth [[UIScreen mainScreen] bounds].size.width
#define ScreenHeight [[UIScreen mainScreen] bounds].size.height
#define BaseHeaderChooseViewBackColor [UIColor whiteColor]
#define GainsboroColor QDGetColor(@"4376CD")
#define appWhiteColor [UIColor whiteColor]
@implementation QDBaseHeaderChooseView{
    CGFloat _titleWidth;
    UIButton * _selectedBtn;
}

- (void)btnClick:(UIButton *)btn{
    
    UIButton * selectedBtn = [self.titleScrollView viewWithTag:btn.tag - 34554 + 12323];
    [self titleClick:selectedBtn];
    

}
- (void)titleClick:(UIButton *)btn{
    
    _selectedBtn.selected = NO;
    _selectedBtn = btn;
    _selectedBtn.selected = YES;
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.5 animations:^{
        __strong typeof(weakSelf) strongSelf = weakSelf;

        if (strongSelf->_selectedBtn.centerX < self.titleScrollView.width * 0.5) {
            self.titleScrollView.contentOffset = CGPointMake(0, 0);
        }else if (strongSelf->_selectedBtn.centerX > self.titleScrollView.contentSize.width - self.titleScrollView.width * 0.5){
            self.titleScrollView.contentOffset = CGPointMake(self.titleScrollView.contentSize.width - self.titleScrollView.width, 0);
        }else{
            self.titleScrollView.contentOffset = CGPointMake(strongSelf->_selectedBtn.centerX - self.titleScrollView.width * 0.5, 0);
        }

    }];
    
    [self.titleScrollView bringSubviewToFront:self.bottomLine];
    [UIView animateWithDuration:0.5 animations:^{
        __strong typeof(weakSelf) strongSelf = weakSelf;
        self.bottomLine.frame = CGRectMake(strongSelf->_selectedBtn.left + strongSelf->_selectedBtn.width * 0.25, titleViewHeight - 2, strongSelf->_selectedBtn.width * 0.5, 2);
    }];
    if (self.headerChooseBtnClickBlock) {
        self.headerChooseBtnClickBlock(btn.tag - 12323,btn);
    }

}

- (void)clickIndex:(NSInteger)index{
    UIButton * btn = (UIButton *)[self.titleScrollView viewWithTag:12323+index];
    [self titleClick:btn];
}

- (void)loadHeaderChooseView{
    if (self.titleArray.count == 0) {
        return;
    }
    
    for (UIView * view in self.subviews) {
        _titleScrollView = nil;
        _bottomLine = nil;
        [view removeFromSuperview];
    }
    
    UIFont * titleFont =  [UIFont systemFontOfSize:14];
    [self titleScrollView];
    _titleWidth = 0;
    for (NSInteger index = 0; index < self.titleArray.count; index++) {
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        CGFloat w =  [self.titleArray[index] widthWithFont:titleFont constrainedToHeight:titleViewHeight] + 40;
        if (self.titleArray.count < 4) {
            w = ScreenWidth * (1.0 / self.titleArray.count);
        }
        btn.frame = CGRectMake(_titleWidth, 0, w, titleViewHeight);
        [btn setTitle:self.titleArray[index] forState:UIControlStateNormal];
        [btn setBackgroundColor:BaseHeaderChooseViewBackColor];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:GainsboroColor forState:UIControlStateSelected];
        btn.titleLabel.font = titleFont;
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        btn.tag = 12323 + index;
        [btn addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        _titleWidth = _titleWidth + w;
        [self.titleScrollView addSubview:btn];
        if (index == self.currentIndex) {
            _selectedBtn = btn;
            [self titleClick:btn];
        }
        
        
    }
    _titleScrollView.contentSize = CGSizeMake(_titleWidth < ScreenWidth?ScreenWidth:_titleWidth, titleViewHeight);
 
}

- (UIScrollView *)titleScrollView{
    if (!_titleScrollView) {
        _titleScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0,self.width, titleViewHeight)];
        _titleScrollView.delegate = self;
        _titleScrollView.showsVerticalScrollIndicator = NO;
        _titleScrollView.showsHorizontalScrollIndicator = NO;
        _titleScrollView.bounces = NO;
        [self addSubview:_titleScrollView];
    }
    return _titleScrollView;
}

- (UIView *)bottomLine{
    if (!_bottomLine) {
        _bottomLine = [[UIView alloc]initWithFrame:CGRectMake(titleViewWidth * 0.25, titleViewHeight - 2, titleViewWidth * 0.5, 2)];
        _bottomLine.backgroundColor = GainsboroColor;
        [self.titleScrollView addSubview:_bottomLine];
    }
    return _bottomLine;
}

@end
