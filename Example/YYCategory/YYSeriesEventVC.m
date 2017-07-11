//
//  YYSeriesEventVC.m
//  YYCategory
//
//  Created by Mr.Pyy on 2017/7/11.
//  Copyright © 2017年 yuanyuan100. All rights reserved.
//

#import "YYSeriesEventVC.h"
#import <YYCategory/UIBarButtonItem+YYSeriesEvent.h>

#import <objc/runtime.h>

@interface YYSeriesEventVC ()

@end

@implementation YYSeriesEventVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //_sendAction:withEvent:
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"next" style:UIBarButtonItemStylePlain target:self action:@selector(barButtonHandler:)];
    self.navigationItem.rightBarButtonItem.yy_preventSeriesEvent = YES;
    //self.navigationItem.rightBarButtonItem.yy_preventInterval = 5.0f;
}

- (void)barButtonHandler:(UIBarButtonItem *)item {
    NSLog(@"连续点击");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
