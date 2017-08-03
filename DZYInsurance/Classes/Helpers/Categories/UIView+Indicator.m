//
//  UIView+Indicator.m
//  DZYInsurance
//
//  Created by zhouyongchao on 16/1/25.
//  Copyright © 2016年 zhouyongchao. All rights reserved.
//

#import "UIView+Indicator.h"

#define hudViewTag                     0x98751235
@implementation UIView (Indicator)

- (void)showIndeterminateHUD {
    [self createHUD];
}

- (void)showIndeterminateHUDWithTitle:(NSString *)title {
    MBProgressHUD *hud = [self createHUD];
    hud.label.text = title;
}

- (void)showIndeterminateHUDWithTitle:(NSString *)title detailTitle:(NSString *)detailTitle {
    MBProgressHUD *hud = [self createHUD];
    hud.label.text = title;
    hud.detailsLabel.text = detailTitle;
}

- (void)showDeterminateHUD {
    MBProgressHUD *hud = [self createHUD];
    hud.mode = MBProgressHUDModeDeterminate;
}

- (void)showDeterminateHUDWithTitle:(NSString *)title {
    MBProgressHUD *hud = [self createHUD];
    hud.mode = MBProgressHUDModeDeterminate;
    hud.label.text = title;
}

- (void)showDeterminateHUDWithTitle:(NSString *)title detailTitle:(NSString *)detailTitle {
    MBProgressHUD *hud = [self createHUD];
    hud.mode = MBProgressHUDModeDeterminate;
    hud.label.text = title;
    hud.detailsLabel.text = detailTitle;
}

- (void)showAnnularDeterminateHUD {
    MBProgressHUD *hud = [self createHUD];
    hud.mode = MBProgressHUDModeAnnularDeterminate;
}

- (void)showAnnularDeterminateHUDWithTitle:(NSString *)title {
    MBProgressHUD *hud = [self createHUD];
    hud.mode = MBProgressHUDModeAnnularDeterminate;
    hud.label.text = title;
}

- (void)showAnnularDeterminateHUDWithTitle:(NSString *)title detailTitle:(NSString *)detailTitle {
    MBProgressHUD *hud = [self createHUD];
    hud.mode = MBProgressHUDModeAnnularDeterminate;
    hud.label.text = title;
    hud.detailsLabel.text = detailTitle;
}

- (void)showTextHUDWithTitle:(NSString *)title {
    MBProgressHUD *hud = [self createHUD];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = title;
}

- (void)showTextHUDWithTitle:(NSString *)title detailTitle:(NSString *)detailTitle {
    MBProgressHUD *hud = [self createHUD];
    hud.mode = MBProgressHUDModeText;
    hud.label.text = title;
    hud.detailsLabel.text = detailTitle;
}

- (void)showBarDeterminateHUD {
    MBProgressHUD *hud = [self createHUD];
    hud.mode = MBProgressHUDModeDeterminateHorizontalBar;
}

- (void)showBarDeterminateHUDWithTitle:(NSString *)title {
    MBProgressHUD *hud = [self createHUD];
    hud.mode = MBProgressHUDModeDeterminateHorizontalBar;
    hud.label.text = title;
}

- (void)showBarDeterminateHUDWithTitle:(NSString *)title detailTitle:(NSString *)detailTitle {
    MBProgressHUD *hud = [self createHUD];
    hud.mode = MBProgressHUDModeDeterminateHorizontalBar;
    hud.label.text = title;
    hud.detailsLabel.text = detailTitle;
}

- (void)showHUDWithCustomView:(UIView *)customView {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.customView = customView;
    hud.square = YES;
}

- (void)showHUDWithCustomView:(UIView *)customView title:(NSString *)title {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.customView = customView;
    hud.square = YES;
    hud.label.text = title;
}

- (void)showHUDWithCustomView:(UIView *)customView title:(NSString *)title detailTitle:(NSString *)detailTitle {
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    hud.customView = customView;
    hud.square = YES;
    hud.label.text = title;
    hud.detailsLabel.text = detailTitle;
}

- (void)hideMBProgressHud {
    MBProgressHUD *hud = [MBProgressHUD HUDForView:self];
    [hud hideAnimated:YES];
}

- (void)hideMBProgressHudAfterDelay:(NSTimeInterval)delay {
    MBProgressHUD *hud = [MBProgressHUD HUDForView:self];
    [hud hideAnimated:YES afterDelay:delay];
}

- (MBProgressHUD *)createHUD {
    MBProgressHUD *hud = [MBProgressHUD HUDForView:self];
    if (!hud) {
        hud = [MBProgressHUD showHUDAddedTo:self animated:YES];
    }
    return hud;
}

@end
