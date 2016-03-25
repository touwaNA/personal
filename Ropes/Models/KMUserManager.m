//
//  KMUserManager.m
//  Ropes
//
//  Created by yzk on 16/3/25.
//  Copyright © 2016年 Madoka. All rights reserved.
//

#import "KMUserManager.h"

@interface KMUserManager ()

@end

static KMUserManager *shareKMUserManager = nil ;

@implementation KMUserManager

+ (KMUserManager *)getInstance
{
    @synchronized(self)
    {
        if(shareKMUserManager == nil)
        {
            shareKMUserManager = [[self alloc] init];
        }
    }
    return shareKMUserManager;
    
}

- (void)getPhoneCodeWithPhoneNum:(NSString *)phoneNum complation:(void (^)(BOOL, id))block
{
    
}

//注册
- (void)registWithPhoneNum:(NSString *)phoneNum verifyPhoneCode:(NSString *)phoneCode comlation:(void(^)(BOOL result,id message))block
{
    
}



@end
