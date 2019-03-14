//
//  AppDelegate.m
//  iOSProject
//
//  Created by 苏秋东 on 2019/3/13.
//  Copyright © 2019 苏秋东. All rights reserved.
//

#import "AppDelegate.h"
@interface AppDelegate ()
@property (nonatomic,strong) QDTabBarViewController *tabbarVC;
@end

@implementation AppDelegate


/**
 APP启动
 */
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    self.tabbarVC = [[QDTabBarViewController alloc]init];
    [self.tabbarVC setupViewControllers];
    self.window.rootViewController = self.tabbarVC;
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    NSLog(@"\n ===> 程序暂行 !");
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    NSLog(@"\n ===> 程序进入后台 !");
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    NSLog(@"\n ===> 程序进入前台 !");
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    NSLog(@"\n ===> 程序重新激活 !");
}


- (void)applicationWillTerminate:(UIApplication *)application {
    NSLog(@"\n ===> 程序意外暂行 !");
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"iOSProject"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
