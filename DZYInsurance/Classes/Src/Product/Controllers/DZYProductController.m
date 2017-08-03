//
//  DZYProductController.m
//  DZYInsurance
//
//  Created by 周永超 on 2017/8/3.
//  Copyright © 2017年 zhouyongchao. All rights reserved.
//

#import "DZYProductController.h"
#import "ULBCollectionViewFlowLayout.h"
#import "DZYProductTextCell.h"
#import "DZYProductImageCell.h"
#import "DZYProductHeaderView.h"

static NSString *const HeaderCellIdentify = @"DZYProductHeaderView";
static NSString *const TextCellIdentify = @"DZYProductTextCell";
static NSString *const ImageCellIdentify = @"DZYProductImageCell";

@interface DZYProductController ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,ULBCollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, assign) InsuranceType categoryId;

@end

@implementation DZYProductController

- (instancetype)initWithCategoryId:(InsuranceType)categoryId {
    
    self = [super init];
    if (self) {
        _categoryId = categoryId;
    }
    return self;
}

- (void)loadView {
    [super loadView];
    [self.view addSubview:self.collectionView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.showNav = NO;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self p_registerCell];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.collectionView.frame = self.view.bounds;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = nil;
    switch (self.categoryId) {
        case InsuranceTypeXianZhong:
        case InsuranceTypeRenQun:
            cell = [collectionView dequeueReusableCellWithReuseIdentifier:TextCellIdentify forIndexPath:indexPath];
            break;
        case InsuranceTypePinPai:
            cell = [collectionView dequeueReusableCellWithReuseIdentifier:ImageCellIdentify forIndexPath:indexPath];
            break;
            
        default:
            break;
    }
    
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(15, 25, 15, 25);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    return CGSizeMake((SCREEN_WIDTH - 100) / 3, 30);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    
    return CGSizeMake(SCREEN_WIDTH, 50);
}

- (UIColor *)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout colorForSectionAtIndex:(NSInteger)section {
    
    return [UIColor whiteColor];
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if (kind == UICollectionElementKindSectionHeader) {
        
        DZYProductHeaderView *headerV = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HeaderCellIdentify forIndexPath:indexPath];
        return headerV;
    }
    
    return nil;
}

#pragma mark - private method

- (void)p_registerCell {
    
    [self.collectionView registerNib:[UINib nibWithNibName:HeaderCellIdentify bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HeaderCellIdentify];
    [self.collectionView registerNib:[UINib nibWithNibName:TextCellIdentify bundle:nil] forCellWithReuseIdentifier:TextCellIdentify];
    [self.collectionView registerNib:[UINib nibWithNibName:ImageCellIdentify bundle:nil] forCellWithReuseIdentifier:ImageCellIdentify];
}

- (void)p_configureCell:(UICollectionViewCell *)cell indexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - getter

- (UICollectionView *)collectionView {
    
    if (!_collectionView) {
        
        ULBCollectionViewFlowLayout *flowLayout = [[ULBCollectionViewFlowLayout alloc]init];
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.alwaysBounceVertical = YES;
        _collectionView.backgroundColor = TableViewColor;
    }
    
    return _collectionView;
}

@end
