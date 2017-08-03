//
//  AFNetWorkTools.h
//  沃德家
//
//  Created by mac on 2017/7/3.
//  Copyright © 2017年 刘学丽. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AFNetWorkTools : NSObject
+(void)postUrl:(NSString *)urlStr parameters:(id)parameters success:(void (^)(id responseObject))success fail:(void (^)())fail;
+ (void)getJSONWithUrl:(NSString *)urlStr parameters:(id)parameters success:(void (^)(id responseObject))success fail:(void (^)())fail;

//json转换
+ (void)postToJsonUrl:(NSString *)urlStr parameters:(id)parameters success:(void (^)(id responseObject))success fail:(void (^)())fail;
@end
