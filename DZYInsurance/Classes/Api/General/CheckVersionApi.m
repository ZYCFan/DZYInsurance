//
//  CheckVersionApi.m
//  DZYInsurance
//
//  Created by 周永超 on 16/7/11.
//  Copyright © 2016年 zhouyongchao. All rights reserved.
//

#import "CheckVersionApi.h"

@implementation CheckVersionApi

- (NSString *)requestUrl {
    return CheckVersionUpdateUrl;
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}

@end
