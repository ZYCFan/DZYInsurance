//
//  HomePageController.m
//  DZYInsurance
//
//  Created by zhouyongchao on 16/1/22.
//  Copyright © 2016年 zhouyongchao. All rights reserved.
//

#import "HomePageController.h"
#import "HomePageService.h"

#import "LoginController.h"

@interface HomePageController ()<LoginDelegate>

@end

@implementation HomePageController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.cusTableView.frame = self.view.bounds;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = @"测试测试测试";
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - inherit method

- (void)setupNavView {
    [super setupNavView];
    [self createNavigationBarRightItemWithTitle:@"登录"];
}

- (void)clickNavBarRightButton:(UIButton *)sender {
    LoginController *loginVC = [[LoginController alloc] initWithViewController:self];
    [loginVC show];
}

#pragma mark - networkRequest
- (void)loadLastData {
    [self endRefreshing];
}

- (void)loadMoreData {
    [self endRefreshing];
}

@end
