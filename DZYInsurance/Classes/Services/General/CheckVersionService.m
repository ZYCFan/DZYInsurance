//
//  CheckVersionService.m
//  DZYInsurance
//
//  Created by 周永超 on 16/7/11.
//  Copyright © 2016年 zhouyongchao. All rights reserved.
//

#import "CheckVersionService.h"
#import "CheckVersionApi.h"

@interface CheckVersionService ()

@property (nonatomic, strong) CheckVersionApi *versionApi;

@end

@implementation CheckVersionService

- (void)checkServerAppVersionWithSuccess:(successBlock)success failure:(failureBlock)failure {
    HTTPMSG_RELEASE_SAFELY(_versionApi);
    self.versionApi = [[CheckVersionApi alloc]init];
    [self.versionApi startWithCompletionBlockWithSuccess:^(YTKBaseRequest *request) {
        
        VersionDTO *resultDTO = [VersionDTO mj_objectWithKeyValues:request.responseJSONObject];
        ReturnCode code = [self handleCorrectDataWithDTO:resultDTO isLogin:NO];
        [self runBlockBaseCode:code successBlock:success failureBlock:failure failureTokenBlock:nil backData:resultDTO];
        
    } failure:^(YTKBaseRequest *request) {
        failure(@"网络请求失败");
    }];
}

@end
