//
//  KMRegistViewController.m
//  Ropes
//
//  Created by Madoka on 16/3/1.
//  Copyright © 2016年 Madoka. All rights reserved.
//

#import "KMRegistViewController.h"

@interface KMRegistViewController ()
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

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    [self.phoneNumTextField resignFirstResponder];
//    [self.verificationTextField resignFirstResponder];
//    [self.passwordTextField resignFirstResponder];
//}
@end
