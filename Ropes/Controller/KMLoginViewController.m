//
//  KMLoginViewController.m
//  Ropes
//
//  Created by Madoka on 16/3/2.
//  Copyright © 2016年 Madoka. All rights reserved.
//

#import "KMLoginViewController.h"
#import "KMAlertView.h"

@interface KMLoginViewController ()<KMAlertViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *phoneNumTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;
@property (weak, nonatomic) IBOutlet UIButton *forgetPwdBtn;

@property (weak, nonatomic) KMAlertView *alertView;
@end

@implementation KMLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self resetNavigationBar];
}
- (void)resetNavigationBar
{
    UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithTitle:@"注册" style:UIBarButtonItemStylePlain target:self action:@selector(popToRegist:)];
    self.navigationItem.rightBarButtonItem = rightBtn;
    self.navigationItem.hidesBackButton = YES;
}
- (void)popToRegist:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    [self.phoneNumTextField resignFirstResponder];
//    [self.passwordTextField resignFirstResponder];
//}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.phoneNumTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
}

- (IBAction)forgetPwdBtnClick:(id)sender {
    KMAlertView *alertView = [[KMAlertView alloc] initWithFrame:CGRectMake(0, 0, 250, 150) andDelegate:self];
    alertView.center = CGPointMake([UIScreen mainScreen].bounds.size.width * 0.5, [UIScreen mainScreen].bounds.size.height * 0.5);
    alertView.alpha = 0.0f;
    [self.view addSubview:alertView];
    [UIView animateWithDuration:0.2f animations:^{
        alertView.alpha = 1.0f;
    }];
    self.alertView = alertView;
}
- (IBAction)loginBtnClick:(id)sender {
    [self performSegueWithIdentifier:@"loginToTabBar" sender:self];
}

#pragma mark - KMAlertView Delegate
- (void)KMAlertView:(KMAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        [UIView animateWithDuration:0.2f animations:^{
            self.alertView.alpha = 0.0f;
        } completion:^(BOOL finished) {
            [self.alertView removeFromSuperview];
        }];
        
    } else {
        
    }
}


@end
