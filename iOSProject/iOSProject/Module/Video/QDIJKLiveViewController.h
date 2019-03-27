//
//  QDIJKLiveViewController.h
//  iOSProject
//
//  Created by 苏秋东 on 2019/3/18.
//  Copyright © 2019 苏秋东. All rights reserved.
//

#import "QDBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface QDIJKLiveViewController : QDBaseViewController
@property (nonatomic,copy) NSString *urlStr;

@property (weak, nonatomic) IBOutlet UIView *playView;
@property (weak, nonatomic) IBOutlet UIButton *playBtn;

@end

NS_ASSUME_NONNULL_END
