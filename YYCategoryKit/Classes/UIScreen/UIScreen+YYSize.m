//
//  UIScreen+YYSize.m
//  YYCategoryKit
//
//  Created by Yvan.Peng on 2018/2/26.
//

#import "UIScreen+YYSize.h"

@implementation UIScreen (YYSize)
+ (UIScrrenYYSize)yy_type {
    UIScrrenYYSize i = UIScrrenYYSize_1125x2436;
    while (i) {
        if (CGSizeEqualToSize([self yy_size], [self yy_sizeType:i])) {
            return i;
        }
        i--;
    }
    return UIScrrenYYSize_Unkown;
}


+ (CGSize)yy_sizeType:(UIScrrenYYSize)type {
    switch (type) {
        case UIScrrenYYSize_320x480:
            return CGSizeMake(320, 480);
        case UIScrrenYYSize_640x960:
            return CGSizeMake(640, 960);
        case UIScrrenYYSize_640x1136:
            return CGSizeMake(640, 1136);
        case UIScrrenYYSize_750x1334:
            return CGSizeMake(750, 1334);
        case UIScrrenYYSize_1080x1920:
            return CGSizeMake(1080, 1920);
        case UIScrrenYYSize_1125x2436:
            return CGSizeMake(1125, 2436);
        default:
            return CGSizeZero;
    }
}

+ (CGSize)yy_size {
    return [UIScreen mainScreen].bounds.size;
}

+ (CGFloat)yy_width {
    return self.yy_size.width;
}

+ (CGFloat)yy_height {
    return self.yy_size.height;
}
@end
