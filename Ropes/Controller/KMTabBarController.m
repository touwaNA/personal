//
//  KMTabBarController.m
//  Ropes
//
//  Created by Madoka on 16/3/2.
//  Copyright © 2016年 Madoka. All rights reserved.
//

#import "KMTabBarController.h"
#import "KMNavigationController.h"
@interface KMTabBarController ()

@end

@implementation KMTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createSubControllers];
}

- (void)createSubControllers
{
    [self.tabBar setTintColor:[UIColor blackColor]];
    [self.tabBar setBackgroundImage:[UIImage imageNamed:@"backGround"]];
    KMNavigationController *preferentialController = [[KMNavigationController alloc] init];
    [preferentialController.view setBackgroundColor:[UIColor orangeColor]];
    preferentialController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"优惠" image:[[UIImage imageNamed:@"preferential"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] tag:0];
    
    UIViewController *walletController = [[UIViewController alloc] init];
    [walletController.view setBackgroundColor:[UIColor yellowColor]];
    walletController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"钱包" image:[[UIImage imageNamed:@"wallet"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] tag:1];
    
    UIViewController *myInfoController = [[UIViewController alloc] init];
    [myInfoController.view setBackgroundColor:[UIColor purpleColor]];
    myInfoController.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我" image:[[UIImage imageNamed:@"myInfo"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] tag:2];
    self.viewControllers = @[preferentialController, walletController, myInfoController];
}

@end
