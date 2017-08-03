//
//  LoginCell.h
//  GTP2P
//
//  Created by 周永超 on 16/5/4.
//  Copyright © 2016年 zhouyongchao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *leftImageView;
@property (nonatomic, copy) NSString *txtValue;
@property (weak, nonatomic) IBOutlet UITextField *rightTextField;

@end
