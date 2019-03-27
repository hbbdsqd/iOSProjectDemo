//
//  Commtools.m
//  iOSProject
//
//  Created by 苏秋东 on 2019/3/13.
//  Copyright © 2019 苏秋东. All rights reserved.
//

#import "CommonTools.h"

@interface CommonTools ()<UIAlertViewDelegate>

@end

@implementation CommonTools
+ (CommonTools*)insatance
{
    static CommonTools* tools = nil;
    static dispatch_once_t toolsDispath;
    dispatch_once(&toolsDispath, ^{
        tools = [[CommonTools alloc] init];
    });
    return tools;
}

+ (BOOL)isBlankString:(NSString *)string{
    if (![string isKindOfClass:[NSString class]]) {
        return YES;
    }
    if (string == nil || string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] == 0) {
        return YES;
    }
    return NO;
}

+ (QDBaseViewController *)getClassVCWithName:(NSString *)className{
    
    Class cls = NSClassFromString(className);
    BOOL isSubClass = [cls isSubclassOfClass:[QDBaseViewController class]];
    if (isSubClass) {
        return (QDBaseViewController *)[[cls alloc]init];
    }else{
        return [[QDBaseViewController alloc]init];
    }
}
@end
