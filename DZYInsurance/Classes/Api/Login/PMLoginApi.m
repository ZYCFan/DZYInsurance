//
//  PMLoginApi.m
//  DZYInsurance
//
//  Created by 周永超 on 16/6/21.
//  Copyright © 2016年 zhouyongchao. All rights reserved.
//

#import "PMLoginApi.h"

@interface PMLoginApi ()

@property (nonatomic, copy) NSString *account;
@property (nonatomic, copy) NSString *password;

@end

@implementation PMLoginApi

- (instancetype)initWithAccount:(NSString *)account password:(NSString *)password {
    self = [super init];
    if (self) {
        _account = account;
        _password = password;
    }
    return self;
}

- (NSString *)requestUrl {
    return LoginUrl;
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}

- (id)requestArgument {
    return @{@"user_name":self.account,
             @"user_pwd":self.password};
}

@end
