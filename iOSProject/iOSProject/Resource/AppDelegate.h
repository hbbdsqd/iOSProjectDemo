//
//  AppDelegate.h
//  iOSProject
//
//  Created by 苏秋东 on 2019/3/13.
//  Copyright © 2019 苏秋东. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

API_AVAILABLE(ios(10.0))
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) Reachability *internetReachability; //检查是否有网络
@property (nonatomic, assign) NetworkStatus  currentNetworkState; //当前网络状态
@property (nonatomic, copy) void(^currentNetworkStateBlock)(NetworkStatus NetState);
@property (nonatomic, strong) UIView *aboveView;//
@property (readonly, strong) NSPersistentContainer *persistentContainer;
@property (nonatomic,strong) QDTabBarViewController *tabbarVC;
- (void)saveContext;


@end

