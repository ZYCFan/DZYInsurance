//
//  AppDelegate+UMeng.m
//  DZYInsurance
//
//  Created by zhouyongchao on 16/2/15.
//  Copyright © 2016年 zhouyongchao. All rights reserved.
//

#import "AppDelegate+UMeng.h"

#define XcodeAppVersion [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
NSString *const kUMengKey = @"56c13f4f67e58ed3790011c7";

@implementation AppDelegate (UMeng)

- (void)integrateUMengWithApplication:(UIApplication *)application options:(NSDictionary *)launchOptions {

    UMConfigInstance.appKey = kUMengKey;
    UMConfigInstance.channelId = @"App Store";
    [MobClick startWithConfigure:UMConfigInstance];
}

@end
