//
//  KMUserManager.h
//  Ropes
//
//  Created by yzk on 16/3/25.
//  Copyright © 2016年 Madoka. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KMUserManager : NSObject

//单例
+ (KMUserManager *)getInstance;

#pragma mark 调用方法
//获取验证码
- (void)getPhoneCodeWithPhoneNum:(NSString *)phoneNum complation:(void(^)(BOOL result,id message))block;
//注册
- (void)registWithPhoneNum:(NSString *)phoneNum verifyPhoneCode:(NSString *)phoneCode comlation:(void(^)(BOOL result,id message))block;


@end
