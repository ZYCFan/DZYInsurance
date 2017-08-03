//
//  MacroDefines.h
//  DZYInsurance
//
//  Created by zhouyongchao on 16/1/22.
//  Copyright © 2016年 zhouyongchao. All rights reserved.
//
#ifndef MacroDefines_h
#define MacroDefines_h

#define SCREEN_HEIGHT                           ([UIScreen mainScreen].bounds.size.height)
#define SCREEN_WIDTH                            ([UIScreen mainScreen].bounds.size.width)

//#define ratio                                  kDeviceWidth / 320.00
#define ratio                                   1

#define COLORFROMHEX(hexValue)    [UIColor \
colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0 \
green:((float)((hexValue & 0xFF00) >> 8))/255.0 \
blue:((float)(hexValue & 0xFF))/255.0 alpha:1.0]

#define Color_RGB(r, g, b, a)                   [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a/1.0]
#define TableViewColor                          Color_RGB(230, 230, 230, 1)
#define NavBarColor                             Color_RGB(41, 94, 155, 1)

//网络返回代码
#define kReturnOk                               @"200"
#define kRetrunError                            @"201"
#define tokenErrorArr                           @[@"202",@"203",@"204"]

/**
 *  输出size或者Rect
 */
#define NSLogRect(rect) NSLog(@"%s x:%.4f, y:%.4f, w:%.4f, h:%.4f", #rect, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height)
#define NSLogSize(size) NSLog(@"%s w:%.4f, h:%.4f", #size, size.width, size.height)

//单例
#undef    DEF_SINGLETON
#define DEF_SINGLETON( __class ) \
+ (__class *)sharedInstance;

#undef    IMP_SINGLETON
#define IMP_SINGLETON( __class ) \
+ (__class *)sharedInstance \
{ \
static dispatch_once_t once; \
static __class * __singleton__; \
dispatch_once( &once, ^{ __singleton__ = [[__class alloc] init]; } ); \
return __singleton__; \
}

//释放YTKRequest专用
#define HTTPMSG_RELEASE_SAFELY(__REF) \
{\
if (nil != (__REF))\
{\
[__REF stop];\
TT_RELEASE_SAFELY(__REF);\
}\
}

#undef TT_RELEASE_SAFELY
#define TT_RELEASE_SAFELY(__REF) \
{\
if (nil != (__REF)) \
{\
__REF = nil;\
}\
}


#endif /* MacroDefines_h */
