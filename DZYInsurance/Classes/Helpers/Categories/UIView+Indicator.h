//
//  UIView+Indicator.h
//  DZYInsurance
//
//  Created by zhouyongchao on 16/1/25.
//  Copyright © 2016年 zhouyongchao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface UIView (Indicator)

- (void)showIndeterminateHUD;
- (void)showIndeterminateHUDWithTitle:(NSString *)title;
- (void)showIndeterminateHUDWithTitle:(NSString *)title detailTitle:(NSString *)detailTitle;

- (void)showDeterminateHUD;
- (void)showDeterminateHUDWithTitle:(NSString *)title;
- (void)showDeterminateHUDWithTitle:(NSString *)title detailTitle:(NSString *)detailTitle;

- (void)showAnnularDeterminateHUD;
- (void)showAnnularDeterminateHUDWithTitle:(NSString *)title;
- (void)showAnnularDeterminateHUDWithTitle:(NSString *)title detailTitle:(NSString *)detailTitle;

- (void)showTextHUDWithTitle:(NSString *)title;
- (void)showTextHUDWithTitle:(NSString *)title detailTitle:(NSString *)detailTitle;

- (void)showBarDeterminateHUD;
- (void)showBarDeterminateHUDWithTitle:(NSString *)title;
- (void)showBarDeterminateHUDWithTitle:(NSString *)title detailTitle:(NSString *)detailTitle;

- (void)showHUDWithCustomView:(UIView *)customView;
- (void)showHUDWithCustomView:(UIView *)customView title:(NSString *)title;
- (void)showHUDWithCustomView:(UIView *)customView title:(NSString *)title detailTitle:(NSString *)detailTitle;

- (void)hideMBProgressHud;
- (void)hideMBProgressHudAfterDelay:(NSTimeInterval)delay;

@end
