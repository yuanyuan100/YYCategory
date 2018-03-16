//
//  UIDevice+YYInterfaceOrientation.m
//  YYCategoryKit
//
//  Created by Yvan.Peng on 2018/3/16.
//

#import "UIDevice+YYInterfaceOrientation.h"

@implementation UIDevice (YYInterfaceOrientation)

+ (void)yy_switchNewOrientation:(UIInterfaceOrientation)interfaceOrientation {
    
    NSNumber *resetOrientationTarget = [NSNumber numberWithInt:UIInterfaceOrientationUnknown];
    
    [[UIDevice currentDevice] setValue:resetOrientationTarget forKey:@"orientation"];
    
    NSNumber *orientationTarget = [NSNumber numberWithInt:interfaceOrientation];
    
    [[UIDevice currentDevice] setValue:orientationTarget forKey:@"orientation"];
    
}

@end
