//
//  PMLoginApi.h
//  DZYInsurance
//
//  Created by 周永超 on 16/6/21.
//  Copyright © 2016年 zhouyongchao. All rights reserved.
//

#import "YTKRequest.h"

@interface PMLoginApi : YTKRequest

- (instancetype)initWithAccount:(NSString *)account password:(NSString *)password;

@end
