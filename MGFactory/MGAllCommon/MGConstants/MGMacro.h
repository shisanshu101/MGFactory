//
//  MGMacro.h
//  MGFactory
//
//  Created by 一只狗 on 2019/7/3.
//  Copyright © 2019 longdian. All rights reserved.
//

#ifndef MGMacro_h
#define MGMacro_h

/// 宽
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
/// 高
#define ScreenHeight  [UIScreen mainScreen].bounds.size.height

#define MainScreenHeight [UIScreen mainScreen].bounds.size.height
#define MainScreenWidth [UIScreen mainScreen].bounds.size.width
#define iOSVersion [[[UIDevice currentDevice] systemVersion] floatValue]

#define DebugLog(fmt, ...) NSLog((@"[%s Line %d] \n" fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)
// 弱引用
#define MJWeakSelf __weak typeof(self) weakSelf = self;

#define RGBA(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define RGCOLOR RGBA(249,249,249)
#define LINERGBA [UIColor colorWithRed:230/255.0 green:230/255.0 blue:230/255.0 alpha:1.0]
#define COLOR_0C UIColorHex(#0C0C0C)
#define BLUECOLOR UIColorHex(#0096E6)//app中的所有蓝色，如果替换，app的所有蓝色都会替换


#endif /* MGMacro_h */
