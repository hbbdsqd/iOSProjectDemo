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


@end
