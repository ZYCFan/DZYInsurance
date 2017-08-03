//
//  PMLoginService.h
//  DZYInsurance
//
//  Created by 周永超 on 16/6/21.
//  Copyright © 2016年 zhouyongchao. All rights reserved.
//

#import "BaseService.h"
#import "LoginDTO.h"

@interface PMLoginService : BaseService

- (void)loginWithAccount:(NSString *)account password:(NSString *)password success:(void(^)(LoginDTO *data))success failure:(void(^)(NSString *errorStr))failure;

@end
