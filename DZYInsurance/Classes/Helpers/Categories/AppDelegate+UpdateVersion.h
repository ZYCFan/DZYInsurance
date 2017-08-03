//
//  AppDelegate+UpdateVersion.h
//  DZYInsurance
//
//  Created by 周永超 on 16/7/5.
//  Copyright © 2016年 zhouyongchao. All rights reserved.
//

#import "AppDelegate.h"
#import "CheckVersionService.h"

@interface AppDelegate (UpdateVersion)

@property (nonatomic, strong) CheckVersionService *checkVersionService;

- (void)checkVersion;

@end
