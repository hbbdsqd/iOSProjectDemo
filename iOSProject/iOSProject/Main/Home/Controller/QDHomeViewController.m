//
//  QDHomeViewController.m
//  iOSProject
//
//  Created by 苏秋东 on 2019/3/13.
//  Copyright © 2019 苏秋东. All rights reserved.
//

#import "QDHomeViewController.h"
@interface QDHomeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation QDHomeViewController{
    NSArray *_titleArray;
    NSArray *_userInfoArray;
}

//@{@"url":@"qdshow://QDAgoreLiveViewController?liveID=123"}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    self.title = NSLocalizedString(@"title", nil);
    _titleArray = @[@"声网直播推流",@"声网直播拉流"];
    _userInfoArray = @[@{@"url":@"qdshow://QDAgoreLiveViewController?liveID=123"},@{@"url":@""}];
    [self addRefreshWithTableView:self.tableView];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.rdv_tabBarController setTabBarHidden:NO animated:YES];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.rdv_tabBarController setTabBarHidden:YES animated:YES];
}

- (void)headerRefresh{
    [self.tableView.mj_header endRefreshing];
}

- (void)footerRefresh{
    [self.tableView.mj_footer endRefreshingWithNoMoreData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellID = @"cellForRowAtIndexPath";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@----%ld",_titleArray[indexPath.row],(long)indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (_userInfoArray.count > indexPath.row) {
        [QDPushRouteHelper handleUserInfo:_userInfoArray[indexPath.row] andRootViewController:self];
    }
}

@end
