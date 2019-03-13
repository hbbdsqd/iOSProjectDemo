//
//  QDBaseViewController.h
//  iOSProject
//
//  Created by 苏秋东 on 2019/3/13.
//  Copyright © 2019 苏秋东. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QDBaseViewController : UIViewController
/**
 * 是否支持右滑返回，默认YES
 */
@property (nonatomic, assign) BOOL popGestureEnable;
//分⻚页数量量
@property (nonatomic,assign) NSInteger page_num;
//分⻚页⼤大⼩小
@property (nonatomic,assign) NSInteger page_size;
//公共数组
@property (nonatomic,strong) NSMutableArray *dataArray;
//公共字典
@property (nonatomic,strong) NSMutableDictionary *dataDict;


- (UIBarButtonItem*)leftMenuBarButtonItem;
/**
 *  在指定view显示搜索没有数据的视图
 */
- (void)showNoDataViewToView:(UIView*)superview withString:(NSString*)string;

/**
 *  从指定view删除搜索没有数据的视图
 */
- (void)hideNoDataViewFromView:(UIView*)superview;

- (void)backPopViewcontroller:(id)sender;

- (void)creatLeftBtnOfCustomWithTitle:(NSString *)title;

- (void)creatRightBtnOfCustomWithTitle:(NSString *)title;

- (void)creatRightBtnOfCustomWithTitle:(NSString *)title textColor:(UIColor *)textColor;

- (void)creatLeftBtnOfCustomWithImage:(NSString *)imageName;

- (void)creatRightBtnOfCustomWithImage:(NSString *)imageName;
@end

NS_ASSUME_NONNULL_END
