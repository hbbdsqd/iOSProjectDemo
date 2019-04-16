//
//  QDNewsMainViewController.m
//  iOSProject
//
//  Created by 苏秋东 on 2019/4/16.
//  Copyright © 2019 苏秋东. All rights reserved.
//

#import "QDNewsMainViewController.h"

@interface QDNewsMainViewController ()

@end

@implementation QDNewsMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.rdv_tabBarController setTabBarHidden:NO animated:YES];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.rdv_tabBarController setTabBarHidden:YES animated:YES];
}
@end
