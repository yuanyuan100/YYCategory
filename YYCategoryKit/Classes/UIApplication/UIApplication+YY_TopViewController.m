//
//  UIApplication+YY_TopViewController.m
//  SMCBProjcet
//
//  Created by SMCB on 2017/11/21.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "UIApplication+YY_TopViewController.h"

@implementation UIApplication (YY_TopViewController)

+ (UIViewController *)yy_topViewController {
    UIViewController *rootViewController = [self sharedApplication].keyWindow.rootViewController;
    UIViewController *currentVC = [self yy_topViewControllerWithRootViewController:rootViewController];
    return currentVC;
}

+ (UIViewController*)yy_topViewControllerWithRootViewController:(UIViewController*)rootViewController
{
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabBarController = (UITabBarController *)rootViewController;
        return [self yy_topViewControllerWithRootViewController:tabBarController.selectedViewController];
    } else if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController* navigationController = (UINavigationController*)rootViewController;
        return [self yy_topViewControllerWithRootViewController:navigationController.visibleViewController];
    } else if (rootViewController.presentedViewController) {
        UIViewController* presentedViewController = rootViewController.presentedViewController;
        if ([presentedViewController isKindOfClass:[UIAlertController class]]) return rootViewController;
        return [self yy_topViewControllerWithRootViewController:presentedViewController];
    } else {
        return rootViewController;
    }
}

@end
