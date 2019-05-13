//
//  QDBaseHeaderChooseView.h
//  QDBaseProject
//
//  Created by 苏秋东 on 2018/6/19.
//  Copyright © 2018年 苏秋东. All rights reserved.
//

#import <UIKit/UIKit.h>

#define titleViewHeight 50
#define titleViewWidth 80

@interface QDBaseHeaderChooseView : UIView<UIScrollViewDelegate>

@property (nonatomic,strong) UIView *bottomLine;
@property (nonatomic,strong) UIScrollView *titleScrollView;
@property (nonatomic,assign) NSInteger currentIndex;
@property (nonatomic,strong) NSArray *titleArray;
@property (nonatomic, copy) void(^headerChooseBtnClickBlock)(NSInteger index,UIButton * btn);

- (void)loadHeaderChooseView;

- (void)clickIndex:(NSInteger)index;
@end
