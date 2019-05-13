//
//  QDNewsMainListTableViewCell.h
//  iOSProject
//
//  Created by 苏秋东 on 2019/5/11.
//  Copyright © 2019 苏秋东. All rights reserved.
//

#import "QDBaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface QDNewsMainListTableViewCell : QDBaseTableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UILabel *contentLab;
@property (weak, nonatomic) IBOutlet UILabel *dateLab;

@end

NS_ASSUME_NONNULL_END
