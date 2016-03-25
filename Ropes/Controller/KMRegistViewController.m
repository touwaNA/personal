//
//  KMRegistViewController.m
//  Ropes
//
//  Created by Madoka on 16/3/1.
//  Copyright © 2016年 Madoka. All rights reserved.
//

#import "KMRegistViewController.h"
#import "KMUserManager.h"
#import <QuartzCore/QuartzCore.h>

@interface KMRegistViewController ()
{
    UILabel *LBtimeoff;
    NSTimer *timer;
    int timeleft;
}
@property (weak, nonatomic) IBOutlet UITextField *phoneNumTextField;
@property (weak, nonatomic) IBOutlet UITextField *verificationTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@property (weak, nonatomic) IBOutlet UIButton *getVerificationCodeBtn;
@property (weak, nonatomic) IBOutlet UIButton *registBtn;

@end

@implementation KMRegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self resetTextField];
    [self resetNavigationBar];
    
}

- (void)resetTextField {
    self.phoneNumTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.passwordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    self.verificationTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
}

- (void)resetNavigationBar
{
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithTitle:@"登录" style:UIBarButtonItemStylePlain target:self action:@selector(pushToLogin:)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    self.navigationItem.hidesBackButton = YES;
}
- (void)pushToLogin:(id)sender {
    [self performSegueWithIdentifier:@"registToLogin" sender:self];
    NSLog(@"跳转到登录界面");
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.phoneNumTextField resignFirstResponder];
    [self.verificationTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
}
//获取验证码
- (IBAction)getPhoneCode:(id)sender
{
    //验证密码有效性
    if ([self verifyPhoneNum]) {
        //添加60等待提示框
        [self addTimeOff:_getVerificationCodeBtn];
        [[KMUserManager getInstance] getPhoneCodeWithPhoneNum:self.phoneNumTextField.text complation:^(BOOL result, id message) {
           
        }];
    }
    
}
//注册
- (IBAction)registAction:(id)sender
{
    //验证注册信息有效性
    if ([self verifyRegist]) {
        
        [[KMUserManager getInstance]registWithPhoneNum:self.phoneNumTextField.text verifyPhoneCode:self.verificationTextField.text comlation:^(BOOL result, id message) {
            
        }];
    }
}

#pragma makr 添加等待时间
- (void)addTimeOff:(UIButton *)view
{
    if (timer) {
        [timer invalidate];
        timer = nil;
        
    }
    if (!LBtimeoff) {
        LBtimeoff = [[UILabel alloc]initWithFrame:view.bounds];
        [LBtimeoff  setBackgroundColor:[UIColor colorWithRed:0.851 green:0.871 blue:0.902 alpha:1]];
        [LBtimeoff setFont:[UIFont fontWithName:@"Helvetica-Bold" size:11]];
        [LBtimeoff setTextAlignment:NSTextAlignmentCenter];
        
        LBtimeoff.layer.masksToBounds = YES;
        LBtimeoff.layer.cornerRadius = 3.0;
        LBtimeoff.layer.borderWidth = 1.0;
        LBtimeoff.layer.borderColor = [[UIColor whiteColor] CGColor];
    }
    [view setEnabled:NO];
    [LBtimeoff setText:@"60s"];
    [view addSubview:LBtimeoff];
    timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
    timeleft = 60;
    [timer fire];
}
- (void)onTimer
{
    timeleft --;
    [LBtimeoff setText:[NSString stringWithFormat:@"%ds",timeleft]];
    if (timeleft == 0) {
        if (timer) {
            [timer invalidate];
            timer = nil;
        }
        [_getVerificationCodeBtn setEnabled:YES];
        [LBtimeoff removeFromSuperview];
    }
}

- (BOOL)verifyPhoneNum
{
    return YES;
}

- (BOOL)verifyRegist
{
    return YES;
}

@end
