//
//  AppDelegate.m
//  CodeDemo
//
//  Created by wangrui on 2017/4/11.
//  Copyright © 2017年 wangrui. All rights reserved.
//

#import "AppDelegate.h"
#import "NormalListController.h"
#import "MoveListController.h"
#import "CustomListController.h"
#import "SixthViewController.h"
#import "BaseNavigationController.h"
#import "CustomNavBarController.h"

UIColor *MainNavBarColor = nil;
UIColor *MainViewColor = nil;

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    
    BaseNavigationController *firstNav = [[BaseNavigationController alloc] initWithRootViewController:[NormalListController new]];
    BaseNavigationController *secondNav = [[BaseNavigationController alloc] initWithRootViewController:[CustomListController new]];
    BaseNavigationController *thirdNav = [[BaseNavigationController alloc] initWithRootViewController:[MoveListController new]];
    UITabBarController *tabBarVC = [UITabBarController new];
    tabBarVC.viewControllers = @[firstNav, secondNav, thirdNav];
    [self setTabBarItems:tabBarVC];
    
    self.window.rootViewController = tabBarVC;
    [self.window makeKeyAndVisible];
    
    [self setNavBarAppearence];
    return YES;
}

- (void)setTabBarItems:(UITabBarController*)tabBarVC
{
    NSArray *titles = @[@"常用", @"自定义导航栏", @"移动导航栏"];
    NSArray *normalImages = @[@"mine", @"mine", @"mine"];
    NSArray *highlightImages = @[@"mineHighlight", @"mineHighlight", @"mineHighlight"];
    [tabBarVC.tabBar.items enumerateObjectsUsingBlock:^(UITabBarItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.title = titles[idx];
        obj.image = [[UIImage imageNamed:normalImages[idx]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        obj.selectedImage = [[UIImage imageNamed:highlightImages[idx]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }];
}

- (void)setNavBarAppearence
{
    MainNavBarColor = [UIColor colorWithRed:0/255.0 green:175/255.0 blue:240/255.0 alpha:1];
    MainViewColor   = [UIColor colorWithRed:126/255.0 green:126/255.0 blue:126/255.0 alpha:1];
    UINavigationBar *navBar = [UINavigationBar appearance];
    [navBar setTintColor:[UIColor whiteColor]];
    [navBar setBarTintColor:MainNavBarColor];
    [navBar setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                     [UIColor whiteColor], NSForegroundColorAttributeName, [UIFont systemFontOfSize:21], NSFontAttributeName, nil]];
}


@end
