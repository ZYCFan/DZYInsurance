//
//  VersionDTO.h
//  DZYInsurance
//
//  Created by 周永超 on 16/7/11.
//  Copyright © 2016年 zhouyongchao. All rights reserved.
//

#import "BaseDTO.h"

@interface VersionData : NSObject

@property (nonatomic, copy) NSString *version;
@property (nonatomic, copy) NSString *checkVersion;

@end

@interface VersionDTO : BaseDTO

@property (nonatomic, strong) VersionData *data;

@end
