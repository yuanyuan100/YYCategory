//
//  UIAlertController+YYConvenient.h
//  YYCategory
//
//  Created by SMCB on 2018/2/6.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIAlertController (YYConvenient)

/**
 便利的调用方法,如你所想的样式 UIAlertControllerStyleAlert, 标题,内容, 确认,取消 都是可选.

 @param title 标题
 @param message 内容
 @param sure 确定
 @param sureCB 确定回调
 @param cancel 取消
 @param cancelCB 取消回调
 @return 初始化对象
 */
+ (nullable instancetype)yyAlertControllerWithTitle:(nullable NSString *)title
                                            message:(nullable NSString *)message
                                               Sure:(nullable NSString *)sure
                                       sureCallBack:(void (^ __nullable)(UIAlertAction *action))sureCB
                                             cancel:(nullable NSString *)cancel
                                     cancelCallBack:(void (^ __nullable)(UIAlertAction *action))cancelCB;
@end

NS_ASSUME_NONNULL_END
