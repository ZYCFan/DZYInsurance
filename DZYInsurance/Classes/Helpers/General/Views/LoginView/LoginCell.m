//
//  LoginCell.m
//  GTP2P
//
//  Created by 周永超 on 16/5/4.
//  Copyright © 2016年 zhouyongchao. All rights reserved.
//

#import "LoginCell.h"

@interface LoginCell ()



@end

@implementation LoginCell

- (void)awakeFromNib {
    // Initialization code
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setTxtValue:(NSString *)txtValue {
    _txtValue = txtValue;
    self.rightTextField.text = txtValue;
}

@end
