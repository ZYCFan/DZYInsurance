//
//  BaseService.m
//  DZYInsurance
//
//  Created by 周永超 on 16/6/21.
//  Copyright © 2016年 zhouyongchao. All rights reserved.
//

#import "BaseService.h"

@implementation BaseService

- (void)runWhenTokenError {
    [[UserCenter sharedInstance] deleteUserInfoWhenTokenError];
}

- (ReturnCode)handleCorrectDataWithDTO:(id)dataDTO isLogin:(BOOL)isLogin {
    
    NSString *result = [dataDTO valueForKey:@"result"];
    if ([result isEqualToString:kReturnOk]) {
        return ReturnCodeSuccess;
    }
    if (isLogin) {
        if ([tokenErrorArr containsObject:result]) {
            [self runWhenTokenError];
            return ReturnCodeTokenError;
        }
    } else {
        return ReturnCodeFailure;
    }
    return ReturnCodeFailure;
}

- (void)runBlockBaseCode:(ReturnCode)code
            successBlock:(successBlock)success
            failureBlock:(failureBlock)failureBlock
       failureTokenBlock:(failureBlockWithToken)failureTokenBlock
                backData:(id)data {
    
    NSString *message = [data valueForKey:@"message"];
    switch (code) {
        case ReturnCodeSuccess:
        {
            if (success) {
                success(data);
            } else {
                NSAssert(success != nil, @"请求成功block不能为空");
            }
        }
            break;
        case ReturnCodeFailure: //此种情况下，分两种情况，一种是登录以后会有token值，另一种是没有登录。登录之前执行failureBlock,登录以后要执行failureTokenBlock;
        {
            if (failureBlock) {
                failureBlock(message);
            } else {
                if (failureTokenBlock) {
                    failureTokenBlock(message, YES);
                } else {
                    NSAssert(failureTokenBlock != nil , @"请求失败block不能为空(带token)");
                }
            }
        }
            break;
        case ReturnCodeTokenError:
        {
            if (failureTokenBlock) {
                failureTokenBlock(message, NO);
            } else {
                NSAssert(failureTokenBlock != nil, @"请求失败bolck不能为空");
            }
        }
            break;
            
        default:
            break;
    }
}


@end
