//
//  BaseService.h
//  DZYInsurance
//
//  Created by 周永超 on 16/6/21.
//  Copyright © 2016年 zhouyongchao. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ReturnCode) {
    ReturnCodeSuccess,
    ReturnCodeFailure,
    ReturnCodeTokenError,
};

typedef void (^successBlock)(id data);
typedef void (^failureBlock)(NSString *errorStr);
typedef void (^failureBlockWithToken)(NSString *errorStr, BOOL tokenCanUse);

@interface BaseService : NSObject
/**
 *  处理后台返回的数据
 *
 *  @param className 接收数据的类名
 */
- (ReturnCode)handleCorrectDataWithDTO:(id)dataDTO isLogin:(BOOL)isLogin;

/**
 *  根据返回的code值执行相应的block
 *
 *  @param code              返回代码
 *  @param success           成功block
 *  @param failureBlock      失败block
 *  @param failureTokenBlock 失败block带token
 *  @param data              json转化的数据模型
 */
- (void)runBlockBaseCode:(ReturnCode)code
            successBlock:(successBlock)success
            failureBlock:(failureBlock)failureBlock
       failureTokenBlock:(failureBlockWithToken)failureTokenBlock
                backData:(id)data;

@end
