//
//  LoginDTO.h
//  DZYInsurance
//
//  Created by 周永超 on 16/6/21.
//  Copyright © 2016年 zhouyongchao. All rights reserved.
//

#import "BaseDTO.h"

@interface LoginData : NSObject

@property (nonatomic, copy) NSString *userid;
@property (nonatomic, copy) NSString *user_name;
@property (nonatomic, copy) NSString *user_type;

@end

@interface LoginDTO : BaseDTO

@property (nonatomic, copy) NSString *token;
@property (nonatomic, strong) LoginData *data;

@end
