//
//  UIDevice+YYModel.h
//  YYCategoryKit
//
//  Created by Yvan.Peng on 2018/2/26.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, UIDeviceYYType) {
    UIDeviceYYTypeIphone_Unknow = 0,
    UIDeviceYYTypeIphone_Simulator,
    UIDeviceYYTypeIphone_4,
    UIDeviceYYTypeIphone_4S,
    UIDeviceYYTypeIphone_5,
    UIDeviceYYTypeIphone_5S,
    UIDeviceYYTypeIphone_5C,
    UIDeviceYYTypeIphone_SE,
    UIDeviceYYTypeIphone_6,
    UIDeviceYYTypeIphone_6S,
    UIDeviceYYTypeIphone_6Plus,
    UIDeviceYYTypeIphone_7,
    UIDeviceYYTypeIphone_7Plus,
    UIDeviceYYTypeIphone_8,
    UIDeviceYYTypeIphone_8Plus,
    UIDeviceYYTypeIphone_X,
};

@interface UIDevice (YYModel)
+ (UIDeviceYYType)yy_type;
@end
