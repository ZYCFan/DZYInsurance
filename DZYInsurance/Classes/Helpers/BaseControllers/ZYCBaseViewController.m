//
//  ZYCBaseViewController.m
//  JHNews
//
//  Created by 周永超 on 2017/4/20.
//  Copyright © 2017年 xiaozhang. All rights reserved.
//

#import "ZYCBaseViewController.h"
#import "NSString+Height.h"

@interface ZYCBaseViewController ()

@property (nonatomic, strong) UIView        *navigationView;
@property (nonatomic, strong) UIImageView   *navigationImageView;
@property (nonatomic, strong) UIView        *bottomLine;
@property (nonatomic, strong) UILabel       *titleLabel;
@property (nonatomic, strong) UIButton      *leftButton;
@property (nonatomic, strong) UIButton      *rightButton;

@end

@implementation ZYCBaseViewController

- (instancetype)init {
    self = [super init];
    if (self) {
        _showNav = YES;
        _showBottomLine = NO;
        _navBarBackgroundColor = NAVIGATION_BAR_COLOR;
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        _showBottomLine = NO;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self p_congfigure];
    [self setupNavView];
    self.showBottomLine = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - private method

- (void)p_congfigure {
    
    [self.navigationView addSubview:self.navigationImageView];
    [self.view addSubview:self.navigationView];
    
    self.bottomLine.backgroundColor = [UIColor lightGrayColor];
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.backgroundColor = [UIColor clearColor];
    
    self.leftButton.contentMode = UIViewContentModeRight;
    [self.leftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.leftButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted | UIControlStateSelected];
    
    self.rightButton.contentMode = UIViewContentModeLeft;
    [self.rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted | UIControlStateSelected];
    
}

#pragma mark - public method

- (void)createNavigationBarWithTitle:(__kindof NSString *)title {
    
    self.titleLabel.text = title;
    
    CGFloat labelWidth = [self.titleLabel.text zyc_widthForFont:self.titleLabel.font];
    CGFloat labelHeight = [self.titleLabel.text zyc_heightForFont:self.titleLabel.font width:labelWidth];
    
    self.titleLabel.frame = CGRectMake((SCREEN_WIDTH - labelWidth) / 2, 20 + (44.f - labelHeight) / 2, labelWidth, labelHeight);
    
    [self.navigationView addSubview:self.titleLabel];
}

- (void)createNavigationBarWithTitle:(__kindof NSString *)title backgroundImageName:(NSString *)imageName {
    
    self.titleLabel.text = title;
    
    CGFloat labelWidth = [self.titleLabel.text zyc_widthForFont:self.titleLabel.font];
    CGFloat labelHeight = [self.titleLabel.text zyc_heightForFont:self.titleLabel.font width:labelWidth];
    
    self.titleLabel.frame = CGRectMake((SCREEN_WIDTH - labelWidth) / 2, 20 + (44.f - labelHeight) / 2, labelWidth, labelHeight);
    
    [self.navigationView addSubview:self.titleLabel];
    
}

- (void)createNavigationBarWithTitleView:(UIView *)titleView {
    
    CGFloat viewWidth = titleView.frame.size.width < SCREEN_WIDTH ? titleView.frame.size.width : SCREEN_WIDTH;
    CGFloat viewHeight = titleView.frame.size.height < 44.f ? titleView.frame.size.height : 44.f;
    
    titleView.frame = CGRectMake((SCREEN_WIDTH - viewWidth) / 2, 20.f + (44.f - viewHeight) / 2, viewWidth, viewHeight);
    
    [self.navigationView addSubview:titleView];
    
}

- (void)createNavigationBarWithTitleView:(UIView *)titleView
                     backgroundImageName:(NSString *)imageName {
    
    self.navigationImageView.image = [UIImage imageNamed:imageName];
    
    CGFloat viewWidth = titleView.frame.size.width < SCREEN_WIDTH - 100 ? titleView.frame.size.width : SCREEN_WIDTH - 100;
    CGFloat viewHeight = titleView.frame.size.height < 44.f ? titleView.frame.size.height : 44.f;
    
    titleView.frame = CGRectMake((SCREEN_WIDTH - viewWidth) / 2, 20.f + (44.f - viewHeight) / 2, viewWidth, viewHeight);
    
    [self.navigationView addSubview:titleView];
}

- (void)createNavigationBarLeftItemWithTitle:(__kindof NSString *)title {
    
    [self.leftButton setTitle:title forState:UIControlStateNormal];
    [self.leftButton setTitle:title forState:UIControlStateSelected | UIControlStateHighlighted];
    
    
    CGFloat labelWidth = [self.leftButton.titleLabel.text zyc_widthForFont:self.leftButton.titleLabel.font];
    CGFloat labelHeight = [self.leftButton.titleLabel.text zyc_heightForFont:self.leftButton.titleLabel.font width:labelWidth];
    
    self.leftButton.frame = CGRectMake(8, 20.f + (44.f - labelHeight) / 2, 44, labelHeight);
    [self.navigationView addSubview:self.leftButton];
    
}

- (void)createNavigationBarLeftItemWithImageName:(NSString *)imageName {
    
    [self.leftButton setImage:[[UIImage imageNamed:imageName ?: @"nav_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [self.leftButton setImage:[[UIImage imageNamed:imageName ?: @"nav_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateHighlighted | UIControlStateSelected];
    
    self.leftButton.frame = CGRectMake(8, 27, 44, 30);
    [self.navigationView addSubview:self.leftButton];
    
}

- (void)createNavigationBarRightItemWithTitle:(__kindof NSString *)title {
    
    [self.rightButton setTitle:title forState:UIControlStateNormal];
    [self.rightButton setTitle:title forState:UIControlStateSelected | UIControlStateHighlighted];
    
    CGFloat labelWidth = [self.rightButton.titleLabel.text zyc_widthForFont:self.rightButton.titleLabel.font];
    CGFloat labelHeight = [self.rightButton.titleLabel.text zyc_heightForFont:self.rightButton.titleLabel.font width:labelWidth];
    
    self.rightButton.frame = CGRectMake(SCREEN_WIDTH - 44 - 8, 20.f + (44.f - labelHeight) / 2, 44, labelHeight);
    [self.navigationView addSubview:self.rightButton];
    
}

- (void)createNavigationBarRightItemWithImageName:(NSString *)imageName {
    
    [self.rightButton setImage:[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [self.rightButton setImage:[[UIImage imageNamed:imageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateHighlighted | UIControlStateSelected];
    
    self.rightButton.frame = CGRectMake(SCREEN_WIDTH - 40 - 8, 27, 44, 30);
    [self.navigationView addSubview:self.rightButton];
    
}

- (void)createNavigationBarRightItemWithCustomView:(UIView *)rightView {
    
    rightView.center = CGPointMake(SCREEN_WIDTH - CGRectGetWidth(rightView.bounds) * 0.5 - 8 , 20 + 44 * 0.5);
    [self.navigationView addSubview:rightView];
}

- (void)clickNavBarLeftButton:(UIButton *)sender {
    [self.view endEditing:YES];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)clickNavBarRightButton:(UIButton *)sender {
    
}

- (void)setupNavView {
    
}

#pragma mark - setter

- (void)setShowNav:(BOOL)showNav {
    _showNav = showNav;
    [self.navigationView removeFromSuperview];
}

- (void)setNavBarBackgroundColor:(UIColor *)navBarBackgroundColor {
    _navBarBackgroundColor = navBarBackgroundColor;
    self.navigationView.backgroundColor = navBarBackgroundColor;
}

- (void)setShowBottomLine:(BOOL)showBottomLine {
    _showBottomLine = showBottomLine;
    
    if (showBottomLine) {
        [self.navigationView addSubview:self.bottomLine];
    } else {
        [self.bottomLine removeFromSuperview];
    }
    
}

- (void)setNavBarTitleColor:(UIColor *)navBarTitleColor {
    _navBarTitleColor = navBarTitleColor;
    
    self.titleLabel.textColor = navBarTitleColor;
}

#pragma mark - getter

- (UIView *)navigationView {
    if (!_navigationView) {
        _navigationView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, CUSTOM_NAV_HEIGHT)];
        _navigationView.backgroundColor = _navBarBackgroundColor;
    }
    return _navigationView;
}

- (UIImageView *)navigationImageView {
    if (!_navigationImageView) {
        _navigationImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, CUSTOM_NAV_HEIGHT)];
    }
    return _navigationImageView;
}

- (UIView *)bottomLine {
    if (!_bottomLine) {
        _bottomLine = [[UIView alloc]initWithFrame:CGRectMake(0, CUSTOM_NAV_HEIGHT - 1 / [UIScreen mainScreen].scale, SCREEN_WIDTH, 1 / [UIScreen mainScreen].scale)];
    }
    return _bottomLine;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
    }
    return _titleLabel;
}

- (UIButton *)leftButton {
    if (!_leftButton) {
        _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_leftButton addTarget:self action:@selector(clickNavBarLeftButton:) forControlEvents:UIControlEventTouchUpInside];
        _leftButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _leftButton;
}

- (UIButton *)rightButton {
    if (!_rightButton) {
        _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _rightButton.titleLabel.font = [UIFont systemFontOfSize:16];
        [_rightButton addTarget:self action:@selector(clickNavBarRightButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightButton;
}

@end
