//
//  DZYProductContainerController.m
//  DZYInsurance
//
//  Created by 周永超 on 2017/8/3.
//  Copyright © 2017年 zhouyongchao. All rights reserved.
//

#import "DZYProductContainerController.h"
#import "DZYProductController.h"
#import "VTMagic.h"

@interface DZYProductContainerController ()<VTMagicViewDataSource,VTMagicViewDelegate>

@property (nonatomic, strong) VTMagicController *magicController;
@property (nonatomic, strong) NSMutableArray *menuList;
@property (nonatomic, strong) NSMutableArray *controllers;

@property (nonatomic, strong) UIButton *btnSearch;

@end

@implementation DZYProductContainerController

- (void)loadView {
    [super loadView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addChildViewController:self.magicController];
    [self.view addSubview:self.magicController.view];
    
    [self.magicController.magicView reloadData];
    
}

- (void)viewDidLayoutSubviews {
    
    [super viewDidLayoutSubviews];
    self.magicController.view.frame = CGRectMake(0, 64, CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) - 64 - 49);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - VTMagicViewDataSource

- (NSArray<NSString *> *)menuTitlesForMagicView:(VTMagicView *)magicView {
    return self.menuList;
}

- (UIButton *)magicView:(VTMagicView *)magicView menuItemAtIndex:(NSUInteger)itemIndex {
    static NSString *itemIdentifier = @"itemIdentifier";
    UIButton *menuItem = [magicView dequeueReusableItemWithIdentifier:itemIdentifier];
    if (!menuItem) {
        menuItem = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuItem setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [menuItem setTitleColor:NAVIGATION_BAR_COLOR forState:UIControlStateSelected];
        menuItem.titleLabel.font = [UIFont systemFontOfSize:16.f];
    }
    return menuItem;
}

- (UIViewController *)magicView:(VTMagicView *)magicView viewControllerAtPage:(NSUInteger)pageIndex {
    return self.controllers[pageIndex];
}

#pragma mark - VTMagicViewDelegate

- (void)magicView:(VTMagicView *)magicView didSelectItemAtIndex:(NSUInteger)itemIndex {
    NSLog(@"didSelectItemAtIndex:%ld", (long)itemIndex);
}

#pragma mark - inherit method

- (void)setupNavView {
    [super setupNavView];
    [self createNavigationBarWithTitleView:self.btnSearch];
}

#pragma mark - getter

- (VTMagicController *)magicController {
    
    if (!_magicController) {
        _magicController = [[VTMagicController alloc]init];
        _magicController.magicView.navigationColor = [UIColor whiteColor];
        _magicController.magicView.sliderColor = NAVIGATION_BAR_COLOR;
        _magicController.magicView.layoutStyle = VTLayoutStyleDivide;
        _magicController.magicView.switchStyle = VTSwitchStyleDefault;
        
        _magicController.magicView.navigationHeight = 44.f;

        _magicController.magicView.navigationHeight = 44.f;
        _magicController.magicView.againstStatusBar = NO;
        _magicController.magicView.sliderExtension = 5.0;
        _magicController.magicView.itemSpacing = 25;
        _magicController.magicView.itemScale = 1.1;
        _magicController.magicView.dataSource = self;
        _magicController.magicView.delegate = self;
        _magicController.magicView.needPreloading = NO;
    }
    
    return _magicController;
}

- (UIButton *)btnSearch {
    
    if (!_btnSearch) {
        _btnSearch = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btnSearch setTitle:@"搜索保险产品" forState:UIControlStateNormal];
        [_btnSearch setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        _btnSearch.backgroundColor = [UIColor whiteColor];
        _btnSearch.layer.cornerRadius = 5.f;
        _btnSearch.frame = CGRectMake(0, 0, SCREEN_WIDTH - 50, 30);
    }
    return _btnSearch;
}

- (NSMutableArray *)menuList {
    if (!_menuList) {
        _menuList = [NSMutableArray arrayWithArray:@[@"按险种",@"按人群",@"按品牌"]];
    }
    return _menuList;
}

- (NSMutableArray *)controllers {
    if (!_controllers) {
        _controllers = [NSMutableArray array];
        
        for (NSInteger i = 0; i < 3; i++) {
            DZYProductController *productVC = [[DZYProductController alloc]initWithCategoryId:i];
            [_controllers addObject:productVC];
        }
    }
    return _controllers;
}

@end
