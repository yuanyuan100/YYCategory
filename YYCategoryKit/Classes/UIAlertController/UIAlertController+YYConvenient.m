//
//  UIAlertController+YYConvenient.m
//  YYCategory
//
//  Created by SMCB on 2018/2/6.
//

#import "UIAlertController+YYConvenient.h"

@implementation UIAlertController (YYConvenient)

+ (instancetype)yyAlertControllerWithTitle:(NSString *)title
                                    message:(NSString *)message
                                       Sure:(NSString *)sure
                               sureCallBack:(void (^)(UIAlertAction *action))sureCB
                                     cancel:(NSString *)cancel
                             cancelCallBack:(void (^)(UIAlertAction *action))cancelCB
{
    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    if (sure.length > 0) {
        UIAlertAction *sureAction = [UIAlertAction actionWithTitle:sure style:UIAlertActionStyleDefault handler:sureCB];
        [alertVC addAction:sureAction];
    }
    if (cancel.length > 0) {
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancel style:UIAlertActionStyleCancel handler:cancelCB];
        [alertVC addAction:cancelAction];
    }
    
    return alertVC;
}

@end

