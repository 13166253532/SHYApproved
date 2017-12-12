//
//  AccountInfoOC.m
//  SHYERP
//
//  Created by xiejiangbo on 2017/10/26.
//  Copyright © 2017年 yin chen. All rights reserved.
//

#import "AccountInfoOC.h"

@implementation AccountInfoOC
+ (AccountInfoOC *)ShareAccountInfoOC{
    static AccountInfoOC *accountInfo = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        accountInfo = [[AccountInfoOC alloc]init];

    });
    return accountInfo;
}
- (void)setStrUserId:(NSString *)companyDate
{
    [[NSUserDefaults standardUserDefaults] setObject:companyDate forKey:@"companyDate"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    _companyDate = companyDate;
}
- (void)setAuthorization:(NSString *)authorization
{
    [[NSUserDefaults standardUserDefaults] setObject:authorization forKey:@"authorization"];
    [[NSUserDefaults standardUserDefaults] synchronize];

    _authorization = authorization;
}
- (void)setQrCodeData:(NSString *)qrCodeData
{
    [[NSUserDefaults standardUserDefaults] setObject:qrCodeData forKey:@"qrCodeData"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    _qrCodeData = qrCodeData;
}

@end
