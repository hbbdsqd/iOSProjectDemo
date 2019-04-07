//
//  QDBaseWebViewViewController.m
//  iOSProject
//
//  Created by 苏秋东 on 2019/3/27.
//  Copyright © 2019 苏秋东. All rights reserved.
//

#import "QDBaseWebViewViewController.h"

@interface QDBaseWebViewViewController ()

@end

@implementation QDBaseWebViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    NSString * urlStr = [self.urlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURL *url = [NSURL URLWithString: urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    _webView.allowsInlineMediaPlayback = YES;
    _webView.mediaPlaybackRequiresUserAction = YES;
}


- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType API_DEPRECATED("No longer supported.", ios(2.0, 12.0)){
    return YES;
}
- (void)webViewDidStartLoad:(UIWebView *)webView API_DEPRECATED("No longer supported.", ios(2.0, 12.0)){
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView API_DEPRECATED("No longer supported.", ios(2.0, 12.0)){
    NSString *title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    if(![CommonTools isBlankString:title]){
        self.title = title;
    }
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error API_DEPRECATED("No longer supported.", ios(2.0, 12.0)){
    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}
@end
