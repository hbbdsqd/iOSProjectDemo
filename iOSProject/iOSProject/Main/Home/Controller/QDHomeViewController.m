//
//  QDHomeViewController.m
//  iOSProject
//
//  Created by 苏秋东 on 2019/3/13.
//  Copyright © 2019 苏秋东. All rights reserved.
//

#import "QDHomeViewController.h"
#import "QDLiveViewController.h"
#import "QDIJKLiveViewController.h"
#import "QDAgoreLiveViewController.h"
@interface QDHomeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation QDHomeViewController{
    NSArray *_titleArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    self.title = NSLocalizedString(@"title", nil);
    _titleArray = @[@"MBProgressHUD展示消息无图标"];
    [self addRefreshWithTableView:self.tableView];
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
    cell.textLabel.text = _titleArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

}

@end
