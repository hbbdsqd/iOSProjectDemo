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
@interface QDHomeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation QDHomeViewController{
    NSArray *_titleArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    _titleArray = @[@"MBProgressHUD展示消息无图标",@"MBProgressHUD展展示成功消息",@"MBProgressHUD展示失败消息",@"MBProgressHUD展示警告消息",@"MBProgressHUD展示loading",@"七牛--m3u8",@"七牛--mp4",@"七牛--flv",@"IJK--m3u8",@"IJK--mp4",@"IJK--flv",@"IJK--抖音滚动",@"IJK--自定义封装"];
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
    switch (indexPath.row) {
        case 0:
        {
            [MBProgressHUD showMessage:_titleArray[indexPath.row]];
        }
            break;
        case 1:
        {
            [MBProgressHUD showSuccess:_titleArray[indexPath.row]];
        }
            break;
        case 2:
        {
            [MBProgressHUD showError:_titleArray[indexPath.row]];
        }
            break;
        case 3:
        {
            [MBProgressHUD showWarning:_titleArray[indexPath.row]];
        }
            break;
        case 4:
        {
            [MBProgressHUD showActivityMessage:@"加载中..."];
            
            [UIView animateWithDuration:3 animations:^{
                [MBProgressHUD hideHUD];
            }];
        }
            break;
        case 5:
        {
            QDLiveViewController * liveVC = [[QDLiveViewController alloc]init];
            liveVC.urlStr = @"http://test.live.shopshops.top/testlive/5c8e116511a52119008b45c6.m3u8?auth_key=1552900843-0-0-0ad7f388d14172ca4978fc2d7b298f72";
            [self.navigationController pushViewController:liveVC animated:YES];
        }
            break;
        case 6:
        {
            QDLiveViewController * liveVC = [[QDLiveViewController alloc]init];
            liveVC.urlStr = @"http://vod.shopshops.top/shortform/video/5c6f2bcd82178a19008b459f_17.mp4";
            [self.navigationController pushViewController:liveVC animated:YES];
        }
            break;
        case 7:
        {
            QDLiveViewController * liveVC = [[QDLiveViewController alloc]init];
            liveVC.urlStr = @"http://liveng.alicdn.com/mediaplatform/92d8f1d3-8b9a-40a6-b6ca-5bfa00a2e746.flv?auth_key=1555414003-0-0-6a1291403c08d4c5f4968d4341bd700a&viewer_id=0";
            [self.navigationController pushViewController:liveVC animated:YES];
        }
            break;
        case 8:
        {
            QDIJKLiveViewController * liveVC = [[QDIJKLiveViewController alloc]init];
            liveVC.urlStr = @"http://test.live.shopshops.top/testlive/5c8e116511a52119008b45c6.m3u8?auth_key=1552900843-0-0-0ad7f388d14172ca4978fc2d7b298f72";
            [self.navigationController pushViewController:liveVC animated:YES];
        }
            break;
        case 9:
        {
            QDIJKLiveViewController * liveVC = [[QDIJKLiveViewController alloc]init];
            liveVC.urlStr = @"http://vod.shopshops.top/shortform/video/5c6f2bcd82178a19008b459f_17.mp4";
            [self.navigationController pushViewController:liveVC animated:YES];
        }
            break;
        case 10:
        {
            QDIJKLiveViewController * liveVC = [[QDIJKLiveViewController alloc]init];
            liveVC.urlStr = @"http://liveng.alicdn.com/mediaplatform/92d8f1d3-8b9a-40a6-b6ca-5bfa00a2e746.flv?auth_key=1555414003-0-0-6a1291403c08d4c5f4968d4341bd700a&viewer_id=0";
            [self.navigationController pushViewController:liveVC animated:YES];
        }
            break;
            
        default:
            break;
    }
}

@end
