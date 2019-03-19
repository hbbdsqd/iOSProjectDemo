//
//  NSDictionary+QDExtension.h
//  iOSProject
//
//  Created by 苏秋东 on 2019/3/14.
//  Copyright © 2019 苏秋东. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (QDExtension)
- (NSString *)getValueForKey:(NSString *)key;
@end

NS_ASSUME_NONNULL_END
