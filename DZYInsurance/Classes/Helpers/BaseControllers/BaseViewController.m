//
//  BaseViewController.m
//  DZYInsurance
//
//  Created by zhouyongchao on 16/1/25.
//  Copyright © 2016年 zhouyongchao. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)showTextMessage:(NSString *)message afterDelay:(NSTimeInterval)delay {
    [self.view showTextHUDWithTitle:message];
    [self.view hideMBProgressHudAfterDelay:delay];
}

@end
