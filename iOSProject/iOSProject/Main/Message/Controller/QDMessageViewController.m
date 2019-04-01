//
//  QDMessageViewController.m
//  iOSProject
//
//  Created by 苏秋东 on 2019/3/13.
//  Copyright © 2019 苏秋东. All rights reserved.
//

#import "QDMessageViewController.h"

@interface QDMessageViewController ()

@end

@implementation QDMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.rdv_tabBarController setTabBarHidden:NO animated:YES];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.rdv_tabBarController setTabBarHidden:YES animated:YES];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [QDPushRouteHelper handleUserInfo:@{@"url":@"qdshow://QDIJKLiveViewController?urlStr=http:\/\/vod.shopshops.top\/shortform\/video\/5c8e3d7a705d2407008b457f_22.mp4"} andRootViewController:self];
}

@end
