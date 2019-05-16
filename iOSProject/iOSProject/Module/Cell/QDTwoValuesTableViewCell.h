//
//  QDTwoValuesTableViewCell.h
//  iOSProject
//
//  Created by 苏秋东 on 2019/5/16.
//  Copyright © 2019 苏秋东. All rights reserved.
//

#import "QDBaseTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface QDTwoValuesTableViewCell : QDBaseTableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UILabel *contentLab;

@end

NS_ASSUME_NONNULL_END
