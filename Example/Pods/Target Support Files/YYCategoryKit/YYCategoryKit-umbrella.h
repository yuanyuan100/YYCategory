#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "YYCategoryHeader.h"
#import "NSBundle+YYModule.h"
#import "NSDictionary+YY_Extension.h"
#import "NSObject+YYDescription.h"
#import "NSObject+YYLog.h"
#import "UIAlertController+YYConvenient.h"
#import "UIApplication+YY_TopViewController.h"
#import "UIBarButtonItem+YYSeriesEvent.h"
#import "UIControl+YYSeriesEvent.h"
#import "UIDevice+YYModel.h"
#import "UIView+YYTouchRangeExpansion.h"

FOUNDATION_EXPORT double YYCategoryKitVersionNumber;
FOUNDATION_EXPORT const unsigned char YYCategoryKitVersionString[];

