//
//  PageRefreshController.m
//  DZYInsurance
//
//  Created by zhouyongchao on 16/1/22.
//  Copyright © 2016年 zhouyongchao. All rights reserved.
//

#import "PageRefreshController.h"
#import "MJRefresh.h"

@interface PageRefreshController ()


@end

@implementation PageRefreshController

#pragma mark - life cycle
- (instancetype)init {
    self = [super init];
    if (self) {
        _currentPage = 0;
        _totalPage = 0;
        _haveRefresh = YES;
    }
    return self;
}

- (instancetype)initWithTableViewStyle:(UITableViewStyle)style {
    self = [self init];
    if (self) {
        _tableViewStyle = style;
    }
    return self;
}

- (void)loadView {
    [super loadView];
    [self.view addSubview:self.cusTableView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.haveRefresh) {
        [self setupRefreshView];
    } else {
        [self loadDataWithoutNoRefresh];
    }
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.cusTableView.frame = self.view.bounds;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc {
    _cusTableView.dataSource = nil;
    _cusTableView.delegate = nil;
    TT_RELEASE_SAFELY(_cusTableView);
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

#pragma mark - private methods
- (void)setupRefreshView {
    @weakify(self);
    self.cusTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        @strongify(self);
        self.currentPage = 1;
        [self loadLastData];
    }];
    
    self.cusTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        @strongify(self);
        if (self.currentPage < self.totalPage) {
            self.currentPage++;
            [self loadMoreData];
        } else {
            [self.cusTableView.mj_footer endRefreshingWithNoMoreData];
        }
    }];
}

#pragma mark - networkRequest
- (void)loadLastData {
    
}

- (void)loadMoreData {
    
}

- (void)endRefreshing {
    [self.cusTableView.mj_header endRefreshing];
    [self.cusTableView.mj_footer endRefreshing];
}

- (void)loadDataWithoutNoRefresh {
    
}

#pragma mark - getters
- (UITableView *)cusTableView {
    if (!_cusTableView) {
        _cusTableView = [[UITableView alloc]initWithFrame:CGRectZero style:self.tableViewStyle];
        _cusTableView.dataSource = self;
        _cusTableView.delegate = self;
        _cusTableView.backgroundColor = TableViewColor;
        _cusTableView.sectionHeaderHeight = 0.0f;
        _cusTableView.sectionFooterHeight = 0.0f;
        _cusTableView.tableFooterView = [[UIView alloc]init];
    }
    return _cusTableView;
}

- (NSInteger)pageCount {
    if (!_pageCount) {
        _pageCount = 10;
    }
    return _pageCount;
}

@end
