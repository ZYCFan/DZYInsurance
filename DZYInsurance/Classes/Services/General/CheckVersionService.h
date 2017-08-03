//
//  CheckVersionService.h
//  DZYInsurance
//
//  Created by 周永超 on 16/7/11.
//  Copyright © 2016年 zhouyongchao. All rights reserved.
//

#import "BaseService.h"
#import "VersionDTO.h"

@interface CheckVersionService : BaseService

- (void)checkServerAppVersionWithSuccess:(successBlock)success failure:(failureBlock)failure;

@end
