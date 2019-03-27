//
//  QDBaseWebViewViewController.h
//  iOSProject
//
//  Created by 苏秋东 on 2019/3/27.
//  Copyright © 2019 苏秋东. All rights reserved.
//

#import "QDBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface QDBaseWebViewViewController : QDBaseViewController
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic,copy) NSString *urlStr;
@end

NS_ASSUME_NONNULL_END
