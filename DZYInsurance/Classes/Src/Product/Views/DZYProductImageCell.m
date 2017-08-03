//
//  DZYProductImageCell.m
//  DZYInsurance
//
//  Created by 周永超 on 2017/8/3.
//  Copyright © 2017年 zhouyongchao. All rights reserved.
//

#import "DZYProductImageCell.h"

@interface DZYProductImageCell ()

@property (weak, nonatomic) IBOutlet UIImageView *imageV;

@end

@implementation DZYProductImageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.imageV.layer.borderWidth = 0.5f;
    self.imageV.layer.borderColor = [UIColor grayColor].CGColor;
    
}

@end
