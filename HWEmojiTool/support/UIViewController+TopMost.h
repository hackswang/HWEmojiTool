//
//  UIViewController+TopMost.h
//  _idx_AppUniversal_library_03751F71_ios_min10.0
//
//  Created by Hacks Wang on 2021/10/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (TopMost)

/*!
 *  \if ENGLISH
 *  \brief Find topmost ViewController
 *  \return Returns the ViewController finded
 *  \else
 *  \brief 寻找最上层的 ViewController
 *  \return 返回最上层的 ViewController
 *  \endif
 */
+ (UIViewController *)topMostViewController;

/*!
 *  \if ENGLISH
 *  \brief Find topmost NavigationController
 *  \return Returns the NavigationController finded
 *  \else
 *  \brief 寻找最上层的 NavigationController
 *  \return 返回最上层的 NavigationController
 *  \endif
 */
+ (UINavigationController *)topMostNavigationController;

@end

NS_ASSUME_NONNULL_END
