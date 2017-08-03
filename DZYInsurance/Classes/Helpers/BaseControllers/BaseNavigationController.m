//
//  BaseNavigationController.m
//  DZYInsurance
//
//  Created by zhouyongchao on 16/1/22.
//  Copyright © 2016年 zhouyongchao. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController
+ (void)initialize
{
    UINavigationBar *navBarAppearance = [UINavigationBar appearance];
    navBarAppearance.tintColor = [UIColor whiteColor];
    navBarAppearance.barTintColor = NAVIGATION_BAR_COLOR;
    [navBarAppearance setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:19 * ratio],
       NSForegroundColorAttributeName:[UIColor whiteColor]}];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationBar.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
