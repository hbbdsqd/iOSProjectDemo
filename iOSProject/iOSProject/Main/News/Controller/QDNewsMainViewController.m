//
//  QDNewsMainViewController.m
//  iOSProject
//
//  Created by 苏秋东 on 2019/4/16.
//  Copyright © 2019 苏秋东. All rights reserved.
//

#import "QDNewsMainViewController.h"
#import "QDBaseHeaderChooseView.h"
#import "QDNewsMainListTableViewCell.h"
@interface QDNewsMainViewController ()
@property (nonatomic,strong) QDBaseHeaderChooseView *headerView;

@property (nonatomic,strong) NSMutableArray *titleArray;
@end

@implementation QDNewsMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"资讯";
    self.titleArray = [NSMutableArray arrayWithArray:@[@"要闻",@"市场",@"行业",@"公司",@"宏观",@"新三板",@"金融",@"产业",@"基金",@"理财"]];
    self.headerView.titleArray = self.titleArray;
    [_headerView loadHeaderChooseView];
    __weak typeof(self) weakSelf = self;
    [_headerView setHeaderChooseBtnClickBlock:^(NSInteger index,UIButton * btn) {
        NSLog(@"index---%ld",(long)index);
    }];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 140;
}

#pragma mark - TableViewDelegate & Datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellID = @"QDNewsMainListTableViewCell";
    QDNewsMainListTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = (QDNewsMainListTableViewCell*)[[[NSBundle mainBundle] loadNibNamed:@"QDNewsMainListTableViewCell" owner:self options:Nil] objectAtIndex:0];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.rdv_tabBarController setTabBarHidden:NO animated:YES];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.rdv_tabBarController setTabBarHidden:YES animated:YES];
}

- (QDBaseHeaderChooseView *)headerView{
    if (!_headerView) {
        _headerView = [[QDBaseHeaderChooseView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, titleViewHeight)];
        [self.view addSubview:_headerView];
    }
    return _headerView;
}
@end
