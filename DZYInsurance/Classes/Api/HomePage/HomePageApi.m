//
//  HomePageApi.m
//  DZYInsurance
//
//  Created by zhouyongchao on 16/1/25.
//  Copyright © 2016年 zhouyongchao. All rights reserved.
//

#import "HomePageApi.h"

@implementation HomePageApi

- (NSString *)requestUrl {
    return @"/test.php";
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPOST;
}

- (id)requestArgument {
    return @{
             @"userid":@"12",
             };
}

- (AFConstructingBlock)constructingBodyBlock {
    return ^(id<AFMultipartFormData> formData) {
        UIImage *image = [UIImage imageNamed:@"back_icon"];
        NSData *imageData = UIImagePNGRepresentation(image);
        [formData appendPartWithFileData:imageData name:@"image" fileName:@"1.png" mimeType:@"image/png"];
    };
}

@end
