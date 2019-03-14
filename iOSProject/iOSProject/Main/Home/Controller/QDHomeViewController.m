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
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    _titleArray = @[@"MBProgressHUD展示消息无图标",@"MBProgressHUD展展示成功消息",@"MBProgressHUD展示失败消息",@"MBProgressHUD展示警告消息",@"MBProgressHUD展示loading"];
    
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

        }
            break;
            
        default:
            break;
    }
}

@end
