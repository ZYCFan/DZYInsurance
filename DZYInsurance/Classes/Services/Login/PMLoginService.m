//
//  PMLoginService.m
//  DZYInsurance
//
//  Created by 周永超 on 16/6/21.
//  Copyright © 2016年 zhouyongchao. All rights reserved.
//

#import "PMLoginService.h"
#import "PMLoginApi.h"

@interface PMLoginService ()

@property (nonatomic, strong) PMLoginApi *loginApi;

@end

@implementation PMLoginService

- (void)loginWithAccount:(NSString *)account password:(NSString *)password success:(void (^)(LoginDTO *))success failure:(void (^)(NSString *))failure {
    
    self.loginApi = [[PMLoginApi alloc]initWithAccount:account password:password];
    [self.loginApi startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
        
        LoginDTO *result = [LoginDTO mj_objectWithKeyValues:request.responseJSONObject];
        ReturnCode code = [self handleCorrectDataWithDTO:result isLogin:NO];
        if (code == ReturnCodeSuccess) {
            UserInfoDTO *userInfoDTO = [[UserInfoDTO alloc]initWithUserId:result.data.userid userName:account userPassword:password userHeadUrl:nil token:result.token];
            [UserCenter sharedInstance].userInfo = userInfoDTO;
            [[UserCenter sharedInstance] savePasswordAndAccount];
        }
        [self runBlockBaseCode:code successBlock:success failureBlock:failure failureTokenBlock:nil backData:result];
        
    } failure:^(YTKBaseRequest *request) {
        failure(@"网络请求失败");
    }];
}

@end
