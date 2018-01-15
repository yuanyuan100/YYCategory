//
//  NSBundle+YYModule.m
//  YYCategory
//
//  Created by GWWL on 2018/1/15.
//

#import "NSBundle+YYModule.h"

@implementation NSBundle (YYModule)

+ (NSBundle *)yyBundleForClass:(Class)cls moduleName:(NSString *)name {
    
    NSParameterAssert(cls);
    NSParameterAssert(name);
    
    if (cls && name) {
        NSBundle *bundle = [NSBundle bundleForClass:cls];
        NSURL *url = [bundle URLForResource:name withExtension:@"bundle"];
        if (url) {
            return [NSBundle bundleWithURL:url];
        }
    }
    
    return nil;
}

@end
