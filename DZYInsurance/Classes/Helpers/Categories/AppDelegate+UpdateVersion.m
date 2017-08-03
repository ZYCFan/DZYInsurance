//
//  AppDelegate+UpdateVersion.m
//  DZYInsurance
//
//  Created by 周永超 on 16/7/5.
//  Copyright © 2016年 zhouyongchao. All rights reserved.
//

#import "AppDelegate+UpdateVersion.h"

@implementation AppDelegate (UpdateVersion)

- (void)setCheckVersionService:(CheckVersionService *)checkVersionService {
    objc_setAssociatedObject(self, @selector(checkVersionService), checkVersionService, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CheckVersionService *)checkVersionService {
    return objc_getAssociatedObject(self, @selector(checkVersionService));
}

- (void)checkVersion {
    self.checkVersionService = [[CheckVersionService alloc]init];
    
    @weakify(self);
    [self.checkVersionService checkServerAppVersionWithSuccess:^(id data) {
        @strongify(self);
        VersionData *result = ((VersionDTO *)data).data;
        NSString *serverVersion = result.version;
        NSString *checkVersion = result.checkVersion;
        if ([checkVersion isEqualToString:@"1"]) {
            [self checkAppStoreVersionWithServerVersion:serverVersion];
        }
    } failure:^(NSString *errorStr) {
        
    }];
}

- (void)checkAppStoreVersionWithServerVersion:(NSString *)serverVersion {
    NSDictionary* infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString* currentVersion = infoDictionary[@"CFBundleShortVersionString"];
    if (![serverVersion isEqualToString:currentVersion]) {
        [self showMessage];
    }
}

- (void)showMessage {
    UIAlertView *alerView = [[UIAlertView alloc]initWithTitle:@"检测更新" message:@"新版本已经发布了，赶快去看看有什么新功能吧😄" delegate:self cancelButtonTitle:@"下次再说" otherButtonTitles:@"现在就去", nil];
    [alerView show];
}

#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:ITunesAppUrl]];
    }
}

@end
