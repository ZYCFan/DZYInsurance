//
//  DZYProductTextCell.m
//  DZYInsurance
//
//  Created by 周永超 on 2017/8/3.
//  Copyright © 2017年 zhouyongchao. All rights reserved.
//

#import "DZYProductTextCell.h"

@interface DZYProductTextCell ()

@property (weak, nonatomic) IBOutlet UILabel *lblText;

@end

@implementation DZYProductTextCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.lblText.backgroundColor = [UIColor whiteColor];
    self.lblText.layer.borderWidth = 0.5f;
    self.lblText.layer.borderColor = [UIColor grayColor].CGColor;
}

@end
