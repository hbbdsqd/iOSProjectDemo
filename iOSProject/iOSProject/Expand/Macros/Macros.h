//
//  Macros.h
//  iOSProject
//
//  Created by 苏秋东 on 2019/3/13.
//  Copyright © 2019 苏秋东. All rights reserved.
//

#ifndef Macros_h
#define Macros_h

#pragma mark --------字体


#define QDGetColor(colorStr) [UIColor colorWithHexString:colorStr]

#define QDColorMain QDGetColor(@"57818B")
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)
#define HEXCOLOR(hex) [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16)) / 255.0 green:((float)((hex & 0xFF00) >> 8)) / 255.0 blue:((float)(hex & 0xFF)) / 255.0 alpha:1]



#pragma mark --------版本

#pragma mark --------色值

#pragma mark --------快捷方式
#define QDGetImage(imageName) [UIImage imageNamed:imageName renderingMode:UIImageRenderingModeAlwaysOriginal]

#endif /* Macros_h */
