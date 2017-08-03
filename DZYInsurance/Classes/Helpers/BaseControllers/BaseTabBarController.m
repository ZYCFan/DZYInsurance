//
//  BaseTabBarController.m
//  DZYInsurance
//
//  Created by zhouyongchao on 16/1/22.
//  Copyright © 2016年 zhouyongchao. All rights reserved.
//

#import "BaseTabBarController.h"
#import "BaseNavigationController.h"
#import "HomePageController.h"
#import "ProductController.h"
#import "DZYProductContainerController.h"

static const CGFloat ControllerCount = 4;

@interface BaseTabBarController ()<UITabBarControllerDelegate,UITabBarDelegate>
/**
 *  设置按钮的标题
 */
@property (copy, nonatomic) NSArray *tabBarTitles;
/**
 *  tabbar的图片
 */
@property (copy, nonatomic) NSDictionary *imageNameDict;
/**
 *  tabbar对应的控制器
 */
@property (copy, nonatomic) NSArray<UINavigationController *> *navigationControllers;

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self customTabBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - private methods
- (void)customTabBar {
    self.tabBar.backgroundColor = [UIColor whiteColor];
    
    NSArray *normalImageNames = self.imageNameDict[@"normalImage"];
    NSArray *selectedImageNames = self.imageNameDict[@"selectedImage"];
    for (int i = 0; i < ControllerCount; i++) {
        UITabBarItem *tabItem = [[UITabBarItem alloc]initWithTitle:self.tabBarTitles[i] image:[UIImage imageNamed:normalImageNames[i]] selectedImage:[[UIImage imageNamed:selectedImageNames[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        [tabItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]} forState:UIControlStateSelected];
//        tabItem.imageInsets = UIEdgeInsetsMake(6 * ratio, 0, -6 * ratio, 0);
        self.navigationControllers[i].tabBarItem = tabItem;
    }
    self.viewControllers = self.navigationControllers;
    self.delegate = self;
}

#pragma mark - getters
- (NSArray *)tabBarTitles {
    if (!_tabBarTitles) {
        _tabBarTitles = @[@"首页",@"产品",@"工作",@"我的"];
    }
    return _tabBarTitles;
}

/**
 *  在此处替换UITabbar的图片
 *
 *  @return 返回图片字典
 */
- (NSDictionary *)imageNameDict {
    if (!_imageNameDict) {
        _imageNameDict = @{
                           @"normalImage":
                               @[@"icon_movie_normal",@"icon_sousuo_normal",@"icon_location_normal",@"icon_wode_normal"],
                           @"selectedImage":
                               @[@"icon_movie_active",@"icon_sousuo_active",@"icon_location_active",@"icon_wode_active"]};
    }
    return _imageNameDict;
}

- (NSArray *)navigationControllers {
    if (!_navigationControllers) {
        HomePageController *homePageVC = [[HomePageController alloc]init];
        
        //HomePageController *homePageVC1 = [[HomePageController alloc]init];
        
        HomePageController *extendVC = [[HomePageController alloc]init];
        HomePageController *homePageVC2 = [[HomePageController alloc]init];
        
        DZYProductContainerController *prod = [[DZYProductContainerController alloc]init];
        
        NSArray *controllerArr = @[homePageVC,prod,extendVC,homePageVC2];
        
        NSMutableArray *navCollections = [NSMutableArray array];
        for (int i = 0; i < ControllerCount; i++) {
            BaseNavigationController *navVC = [[BaseNavigationController alloc]initWithRootViewController:controllerArr[i]];
            [navCollections addObject:navVC];
        }
        _navigationControllers = navCollections;
    }
    return _navigationControllers;
}

@end
