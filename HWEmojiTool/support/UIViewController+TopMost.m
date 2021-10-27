//
//  UIViewController+TopMost.m
//  _idx_AppUniversal_library_03751F71_ios_min10.0
//
//  Created by Hacks Wang on 2021/10/12.
//

#import "UIViewController+TopMost.h"

@implementation UIViewController (TopMost)

+ (UIViewController *)topMostViewController {
    UIViewController *viewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    return [UIViewController findBestViewController:viewController];
}

+ (UIViewController *)findBestViewController:(UIViewController *)vc {
    if (vc.presentedViewController) {
        // Return presented view controller
        return [UIViewController findBestViewController:vc.presentedViewController];
    } else if ([vc isKindOfClass:[UISplitViewController class]]) {
        // Return right hand side
        UISplitViewController *svc = (UISplitViewController*) vc;
        if (svc.viewControllers.count > 0) {
            return [UIViewController findBestViewController:svc.viewControllers.lastObject];
        } else {
            return vc;
        }
    } else if ([vc isKindOfClass:[UINavigationController class]]) {
        // Return top view
        UINavigationController *nvc = (UINavigationController*) vc;
        if (nvc.viewControllers.count > 0) {
            return [UIViewController findBestViewController:nvc.topViewController];
        } else {
            return vc;
        }
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        // Return visible view
        UITabBarController *svc = (UITabBarController*) vc;
        if (svc.viewControllers.count > 0) {
            return [UIViewController findBestViewController:svc.selectedViewController];
        } else {
            return vc;
        }
    } else {
        // Unknown view controller type, return last child view controller
        return vc;
    }
}

+ (UINavigationController *)topMostNavigationController {
    return [self topMostViewController].navigationController;
}

@end
