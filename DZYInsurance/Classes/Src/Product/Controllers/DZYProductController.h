//
//  DZYProductController.h
//  DZYInsurance
//
//  Created by 周永超 on 2017/8/3.
//  Copyright © 2017年 zhouyongchao. All rights reserved.
//

#import "ZYCBaseViewController.h"

typedef NS_ENUM(NSInteger, InsuranceType) {
    
    InsuranceTypeXianZhong,
    InsuranceTypeRenQun,
    InsuranceTypePinPai,
};

@interface DZYProductController : ZYCBaseViewController

- (instancetype)initWithCategoryId:(InsuranceType)categoryId;

@end
