//
//  AccountInfoOC.h
//  SHYERP
//
//  Created by xiejiangbo on 2017/10/26.
//  Copyright © 2017年 yin chen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AccountInfoOC : NSObject
+ (AccountInfoOC *)ShareAccountInfoOC;
@property (nonatomic, strong) NSString *companyDate;
@property (nonatomic, strong) NSString *authorization;
@property (nonatomic, strong) NSString *qrCodeData;
@end
