//
//  NSBundle+YYModule.h
//  YYCategory
//
//  Created by GWWL on 2018/1/15.
//

#import <Foundation/Foundation.h>

@interface NSBundle (YYModule)

+ (nullable NSBundle *)yyBundleForClass:(nonnull Class)cls moduleName:(nonnull NSString *)name;

@end
