//
//  QDHomeViewController.m
//  iOSProject
//
//  Created by 苏秋东 on 2019/3/13.
//  Copyright © 2019 苏秋东. All rights reserved.
//

#import "QDHomeViewController.h"

@interface QDHomeViewController ()

@end

@implementation QDHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    QDBaseViewController * vc = [[QDBaseViewController alloc]init];
    vc.view.backgroundColor = QDColorMain;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
