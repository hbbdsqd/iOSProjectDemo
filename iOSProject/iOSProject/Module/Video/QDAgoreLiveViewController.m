//
//  QDAgoreLiveViewController.m
//  iOSProject
//
//  Created by 苏秋东 on 2019/3/19.
//  Copyright © 2019 苏秋东. All rights reserved.
//

#import "QDAgoreLiveViewController.h"
#import <AgoraRtcEngineKit/AgoraRtcEngineKit.h>

@interface QDAgoreLiveViewController ()<AgoraLiveDelegate,AgoraRtcEngineDelegate>
@property(nonatomic,strong)UIView *agLiveView;

@property (strong, nonatomic) AgoraRtcEngineKit *rtcEngine;

@end

@implementation QDAgoreLiveViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    _agLiveView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, QDScreen_Width, QDScreen_Height)];
    [_agLiveView setBackgroundColor:[UIColor blackColor]];
    [self.view addSubview:_agLiveView];
    [self play];
}

- (void)backPopViewcontroller:(id)sender{
    
    [self.rtcEngine leaveChannel:nil];
    [super backPopViewcontroller:sender];
    
    [AgoraLiveKit destroy];
    [AgoraRtcEngineKit destroy];
}

-(void)play{

    NSString * appid = @"dac19cb04202499a8ee5ca1f7085d0ff";
    NSInteger uid = 197300355;
    NSString *channelId = @"5c91bd80fd1e36001c4f8fd8";
    NSString * token = @"006dac19cb04202499a8ee5ca1f7085d0ffIABgTY2zcDaUnD8ubhSy5muu7+aNZwIi8U39nuzS5TMxro/ewwXNe04pKADHTAAAHg+TXAUAAQAAAAAAAgAAAAAAAwAAAAAABAAAAAAAZQAAAAAA";
    self.rtcEngine = [AgoraRtcEngineKit sharedEngineWithAppId:appid delegate:self];
    [self.rtcEngine enableVideo];
    [self.rtcEngine enableAudio];
    [self.rtcEngine setChannelProfile:AgoraChannelProfileLiveBroadcasting];
    
    AgoraVideoEncoderConfiguration *agoraConfig = [[AgoraVideoEncoderConfiguration alloc] initWithSize:CGSizeMake(640, 360) frameRate:15 bitrate:1000 orientationMode:AgoraVideoOutputOrientationModeAdaptative];
    [self.rtcEngine setVideoEncoderConfiguration:agoraConfig];
    
    [self.rtcEngine setVideoQualityParameters:false];
    [self.rtcEngine enableDualStreamMode:false];
    [self.rtcEngine setClientRole:AgoraClientRoleBroadcaster];
    [self.rtcEngine setAudioProfile:2 scenario:2];
    [self.rtcEngine setCameraAutoFocusFaceModeEnabled:YES];//人脸对焦
    // 获取Documents目录路径
    NSString *docDir = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString* strUrl = [docDir stringByAppendingPathComponent:@"log.md"];
    [self.rtcEngine setLogFile:strUrl];
    
    
    AgoraRtcVideoCanvas *canvas = [[AgoraRtcVideoCanvas alloc] init];
    canvas.view = _agLiveView;
    canvas.renderMode = AgoraVideoRenderModeHidden;
    [self.rtcEngine setupLocalVideo:canvas];
    
    [self.rtcEngine joinChannelByToken:token channelId:channelId  info:nil uid:uid joinSuccess:nil];
    [self.rtcEngine startPreview];
}

- (void)rtcEngine:(AgoraRtcEngineKit * _Nonnull)engine didJoinedOfUid:(NSUInteger)uid elapsed:(NSInteger)elapsed;
{
    
}
//MARK: - AgoraRtcEngineDelegate
- (void)rtcEngine:(AgoraRtcEngineKit *)engine didJoinChannel:(NSString*)channel withUid:(NSUInteger)uid elapsed:(NSInteger)elapsed {
    NSLog(@"%@",[NSString stringWithFormat:@"Join channel success, uid: %lu", (unsigned long)uid]);
    // 旁路直播
//    [self getALtuiliuURL];
    
}

- (void)rtcEngine:(AgoraRtcEngineKit *)engine firstLocalVideoFrameWithSize:(CGSize)size elapsed:(NSInteger)elapsed {
    NSLog(@"firstLocalVideoFrameWithSize, %f x %f", size.width, size.height);
    
}
//重新加入
- (void)rtcEngine:(AgoraRtcEngineKit *)engine didRejoinChannel:(NSString *)channel withUid:(NSUInteger)uid elapsed:(NSInteger) elapsed {
    
}

- (void)rtcEngine:(AgoraRtcEngineKit * _Nonnull)engine firstRemoteVideoFrameOfUid:(NSUInteger)uid size:(CGSize)size elapsed:(NSInteger)elapsed {
    NSLog(@"firstRemoteVideoFrameOfUid, %lu, size: %f x %f", (unsigned long)uid, size.width, size.height);
}
//离开直播间
- (void)rtcEngine:(AgoraRtcEngineKit *)engine didOfflineOfUid:(NSUInteger)uid reason:(AgoraUserOfflineReason)reason {
    
    NSLog(@"%@", [NSString stringWithFormat:@"remote user offline: %lu", (unsigned long)uid]);
    
}

- (void)rtcEngine:(AgoraRtcEngineKit * _Nonnull)engine streamPublishedWithUrl:(NSString * _Nonnull)url errorCode:(AgoraErrorCode)errorCode {
    
    
    
    
    NSLog(@"%@", [NSString stringWithFormat:@"streamPublishedWithUrl: %@, error: %d", url, (int)errorCode]);
    
}

- (void)rtcEngine:(AgoraRtcEngineKit * _Nonnull)engine streamUnpublishedWithUrl:(NSString * _Nonnull)url {
    
    NSLog(@"%@", [NSString stringWithFormat:@"streamUnpublishedWithUrl: %@", url]);
}

- (void)rtcEngineTranscodingUpdated:(AgoraRtcEngineKit * _Nonnull)engine {
    
}

- (void)rtcEngine:(AgoraRtcEngineKit *)engine didOccurWarning:(AgoraWarningCode)warningCode {
    NSLog(@"didOccurWarning: %d", (int)warningCode);

}

- (void)rtcEngine:(AgoraRtcEngineKit *)engine didOccurError:(AgoraErrorCode)errorCode {
    
}

- (void)rtcEngineConnectionDidInterrupted:(AgoraRtcEngineKit * _Nonnull)engine {
    
}

- (void)rtcEngineConnectionDidLost:(AgoraRtcEngineKit *)engine {
    
}

@end
