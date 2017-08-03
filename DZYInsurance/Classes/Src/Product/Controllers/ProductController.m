//
//  ProductController.m
//  DZYInsurance
//
//  Created by Dao on 2017/7/31.
//  Copyright © 2017年 zhouyongchao. All rights reserved.
//

#import "ProductController.h"

@interface ProductController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) UITableView *tableView;

@end

@implementation ProductController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 40, 80, SCREEN_HEIGHT)];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:_tableView];

}


#pragma mark - UITableViewDataSource

//告诉table有多少组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

//告诉table一组有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

//告诉table一行显示什么数据
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = @"推荐";
    return cell;
}

//设置tableview的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
 return 80;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

//
//- (NSMutableArray *)allDataArray{
//    if (!_allDataArray) {
//        _allDataArray = [[NSMutableArray alloc]init];
//    }
//    return _allDataArray;
//}
//
//// 返回分区数
//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
//    
//    return 1;
//}
//
//// 每个分区多少个item
//- (NSInteger )collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
//    
//    return _allDataArray.count;
//}
//
//- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
//    //    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CELL" forIndexPath:indexPath];
//    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CELL" forIndexPath:indexPath];
//    // 取出每个item所需要的数据
//    NSDictionary *dic = [_allDataArray objectAtIndex:indexPath.item];
//    // 取出图片名称
//    NSString *imageString = [dic objectForKey:@"imageName"];
//    cell.imageView.image = [UIImage imageNamed:imageString];
//    // 取出文字
//    NSString *textString = [dic objectForKey:@"textLable"];
//    cell.titleLabel.text = textString;
//    cell.titleLabel.backgroundColor = [UIColor blackColor];
//    cell.titleLabel.textColor = [UIColor whiteColor];
//    cell.backgroundColor = [UIColor colorWithRed:arc4random()%256/256.0 green:arc4random()%256/256.0 blue:arc4random()%256/256.0 alpha:1];
//    
//    
//    return cell;
//}
//
//// 点击图片的方法
//- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    NSLog(@"我点击了%ld图片！！！",indexPath.item + 1);
//    
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
