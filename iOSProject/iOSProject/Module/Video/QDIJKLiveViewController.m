//
//  QDIJKLiveViewController.m
//  iOSProject
//
//  Created by 苏秋东 on 2019/3/18.
//  Copyright © 2019 苏秋东. All rights reserved.
//

#import "QDIJKLiveViewController.h"




@interface QDIJKLiveViewController ()

@property (nonatomic, strong) IJKFFMoviePlayerController *player;
@property (nonatomic, strong) ZFPlayerControlView *controlView;
@end

@implementation QDIJKLiveViewController
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
 
}
- (ZFPlayerControlView *)controlView {
    if (!_controlView) {
        _controlView = [ZFPlayerControlView new];
        _controlView.fastViewAnimated = YES;
    }
    return _controlView;
} 
-(void)viewDidLoad {
    [super viewDidLoad];
    /// playerManager
//    ZFIJKPlayerManager *playerManager = [[ZFIJKPlayerManager alloc] init];
    /// player的tag值必须在cell里设置
    
    
    self.player = [[IJKFFMoviePlayerController alloc]initWithContentURLString:self.urlStr withOptions:nil];
    UIView *playerView =[_player view];
    
    playerView.frame = self.view.bounds;
    
    playerView.autoresizingMask= UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    
    [_player setScalingMode:IJKMPMovieScalingModeAspectFill];
    
    [self.view addSubview:playerView];
    
    [self.player prepareToPlay];
    [self.player play];
    
    

}
-(IBAction)clickedAction:(id)sender {
    
}
@end
