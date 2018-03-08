//
//  UIView+YYLine.m
//  YYCategoryKit
//
//  Created by Yvan.Peng on 2018/3/7.
//

#import "UIView+YYLine.h"

const CGFloat kYYLineWidth = 0.66;

/// 默认线的颜色
#ifndef YYLineDefaultColor
#define YYLineDefaultColor [UIColor colorWithRed:217/250.0 green:217/250.0 blue:217/250.0 alpha:1.0]
#endif

@implementation UIView (YYLine)
- (NSArray<UIView *> *)addLinePosition:(YYLineDirection)direction {
    return [self addLinePosition:direction position:YYLinePositionMake(0, 0, 0,kYYLineWidth)];
}

- (NSArray<UIView *> *)addLinePosition:(YYLineDirection)direction position:(YYLinePosition)position {
    return [self addLinePosition:direction color:YYLineDefaultColor position:position];
}

- (NSArray<UIView *> *)addLinePosition:(YYLineDirection)direction color:(UIColor *)color {
    return [self addLinePosition:direction color:color position:YYLinePositionMake(0, 0, 0, kYYLineWidth)];
}

- (NSArray<UIView *> *)addLinePosition:(YYLineDirection)direction color:(UIColor *)color position:(YYLinePosition)position {
    
    NSMutableArray *muArray = [[NSMutableArray alloc] init];
    
    if (direction & YYLineDirectionTop) {
        UIView *line = [self yy_initLineViewWithColor:color];
        [muArray addObject:line];
        [self addSubview:line];
        NSArray<__kindof NSLayoutConstraint *> *hConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-start-[line]-end-|" options:0 metrics:@{@"start":@(position.start), @"end":@(position.end)} views:NSDictionaryOfVariableBindings(line)];
        NSArray<__kindof NSLayoutConstraint *> *vConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-space-[line(==width)]" options:0 metrics:@{@"width":@(position.width),@"space":@(position.space)} views:NSDictionaryOfVariableBindings(line)];
        [NSLayoutConstraint activateConstraints:vConstraints];
        [NSLayoutConstraint activateConstraints:hConstraints];
    }
    
    if (direction & YYLineDirectionLeft) {
        UIView *line = [self yy_initLineViewWithColor:color];
        [muArray addObject:line];
        [self addSubview:line];
        NSArray<__kindof NSLayoutConstraint *> *vConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-start-[line]-end-|" options:0 metrics:@{@"start":@(position.start), @"end":@(position.end)} views:NSDictionaryOfVariableBindings(line)];
        NSArray<__kindof NSLayoutConstraint *> *hConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-space-[line(==width)]" options:0 metrics:@{@"width":@(position.width),@"space":@(position.space)} views:NSDictionaryOfVariableBindings(line)];
        [NSLayoutConstraint activateConstraints:vConstraints];
        [NSLayoutConstraint activateConstraints:hConstraints];
    }
    
    if (direction & YYLineDirectionBottom) {
        UIView *line = [self yy_initLineViewWithColor:color];
        [muArray addObject:line];
        [self addSubview:line];
        NSArray<__kindof NSLayoutConstraint *> *hConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-start-[line]-end-|" options:0 metrics:@{@"start":@(position.start), @"end":@(position.end)} views:NSDictionaryOfVariableBindings(line)];
        NSArray<__kindof NSLayoutConstraint *> *vConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[line(==width)]-space-|" options:0 metrics:@{@"width":@(position.width),@"space":@(position.space)} views:NSDictionaryOfVariableBindings(line)];
        [NSLayoutConstraint activateConstraints:vConstraints];
        [NSLayoutConstraint activateConstraints:hConstraints];
    }
    
    if (direction & YYLineDirectionRight) {
        UIView *line = [self yy_initLineViewWithColor:color];
        [muArray addObject:line];
        [self addSubview:line];
        NSArray<__kindof NSLayoutConstraint *> *vConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-start-[line]-end-|" options:0 metrics:@{@"start":@(position.start), @"end":@(position.end)} views:NSDictionaryOfVariableBindings(line)];
        NSArray<__kindof NSLayoutConstraint *> *hConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[line(==width)]-space-|" options:0 metrics:@{@"width":@(position.width), @"space":@(position.space)} views:NSDictionaryOfVariableBindings(line)];
        [NSLayoutConstraint activateConstraints:vConstraints];
        [NSLayoutConstraint activateConstraints:hConstraints];
    }
    
    return [muArray copy];
}

- (UIView *)yy_initLineViewWithColor:(UIColor *)color {
    UIView *line = [UIView new];
    line.backgroundColor = color;
    line.userInteractionEnabled = NO;
    line.translatesAutoresizingMaskIntoConstraints = NO;
    return line;
}

@end

YYLinePosition YYLinePositionMake(CGFloat s, CGFloat e, CGFloat p, CGFloat w) {
    YYLinePosition position;
    position.start = s;
    position.end = e;
    position.space = p;
    position.width = w;
    return position;
}


