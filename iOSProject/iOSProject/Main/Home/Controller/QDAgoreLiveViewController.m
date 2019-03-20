//
//  QDAgoreLiveViewController.m
//  iOSProject
//
//  Created by 苏秋东 on 2019/3/19.
//  Copyright © 2019 苏秋东. All rights reserved.
//

#import "QDAgoreLiveViewController.h"

@interface QDAgoreLiveViewController ()<AgoraLiveDelegate,AgoraRtcEngineDelegate>
@property(nonatomic,strong)UIView *agLiveView;
/**声网视频源*/
@property(nonatomic,strong)AgoraLiveKit *aLiveLiveKit;
/**订阅者*/
@property(nonatomic,strong)AgoraLiveSubscriber *publisher;
@property (strong, nonatomic) AgoraRtcEngineKit *rtcEngine;
@property(assign,nonatomic)NSInteger ids;
@property(nonatomic,strong)UIImageView *image;

@end

@implementation QDAgoreLiveViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self play];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(removePlay) name:@"agoraPlay" object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(mute) name:@"AgoraMute" object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(cancleMute) name:@"Agoraplay" object:nil];
    
}
-(void)removePlay{
    [_publisher unsubscribeToHostUid:_ids];
    [_aLiveLiveKit leaveChannel];
    [self.rtcEngine setDelegate:nil];
    [AgoraLiveKit destroy];
    [AgoraRtcEngineKit destroy];
}
-(void)mute{
    [self.rtcEngine muteAllRemoteAudioStreams:YES];
}
-(void)cancleMute{
    [self.rtcEngine muteAllRemoteAudioStreams:NO];
}
-(void)play{
    _agLiveView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    NSString *filepath=[[NSBundle mainBundle] pathForResource:@"loadingAg" ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:filepath];
    _agLiveView.layer.contents=(id)image.CGImage;// 图片不拉伸
    [self.view addSubview:_agLiveView];
    _aLiveLiveKit=[AgoraLiveKit sharedLiveKitWithAppId:@"dac19cb04202499a8ee5ca1f7085d0ff"];
    _aLiveLiveKit.delegate=self;
    _rtcEngine=[AgoraRtcEngineKit sharedEngineWithAppId:@"dac19cb04202499a8ee5ca1f7085d0ff" delegate:self];
    [_rtcEngine enableDualStreamMode:false];
    _publisher=[[AgoraLiveSubscriber alloc] initWithLiveKit:_aLiveLiveKit];
    NSMutableDictionary *dic= [[NSMutableDictionary alloc] init];
    dic[@"channelName"]=self.liveID;
    dic[@"expireTimestamp"]=@"0";
    dic[@"uid"]=@"197300355";
    [self.aLiveLiveKit joinChannelByToken:@"006dac19cb04202499a8ee5ca1f7085d0ffIAALsiEBF9E5YFFb6VjdR9bcLEiaN+FdF0bOfHHZoq05LK4mZwXNe04pKAAHhAAAqyeSXAUAAQAAAAAAAgAAAAAAAwAAAAAABAAAAAAAZQAAAAAA" channelId:self.liveID config:[AgoraLiveChannelConfig defaultConfig] uid:197300355];
    
    
}
- (void)rtcEngine:(AgoraRtcEngineKit * _Nonnull)engine didJoinedOfUid:(NSUInteger)uid elapsed:(NSInteger)elapsed;
{
    _ids=uid;
    _image!=nil?[_image removeFromSuperview]:nil;
    if (_publisher!=nil) {
        [[NSNotificationCenter defaultCenter]postNotificationName:@"userADD" object:nil];
        [_publisher subscribeToHostUid:uid mediaType:AgoraMediaTypeAudioAndVideo view:_agLiveView renderMode:AgoraVideoRenderModeHidden videoType:AgoraVideoStreamTypeHigh];
    }
    
}
//本地用户加入频道的事件
-(void)liveKit:(AgoraLiveKit *)kit didJoinChannel:(NSString *)channel withUid:(NSUInteger)uid elapsed:(NSInteger)elapsed{
    NSLog(@"本地用户加入频道的事件%lu",(unsigned long)uid);
    
}
//  SDK 内发生的警告。 应用程序可以忽略警告而 SDK 可以尝试自动恢复
- (void)liveKit:(AgoraLiveKit *_Nonnull)kit didOccurWarning:(AgoraWarningCode)warningCode{
    
}
//故障发生于 SDK 内。 SDK 不能恢复到正常状态，需要由应用程序解决故障.
- (void)liveKit:(AgoraLiveKit *_Nonnull)kit didOccurError:(AgoraErrorCode)errorCode{
    
}
- (void)rtcEngine:(AgoraRtcEngineKit * _Nonnull)engine didOfflineOfUid:(NSUInteger)uid reason:(AgoraUserOfflineReason)reason{
    [_publisher unsubscribeToHostUid:_ids];
    _image=[[UIImageView alloc] init];
    _image.frame=CGRectMake(0, 0, QDCScreen_Width, QDScreen_Height);
    _image.image=[UIImage imageNamed:@"loadingAg"];
    [_agLiveView addSubview:_image];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"userOFF" object:nil];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */


@end
