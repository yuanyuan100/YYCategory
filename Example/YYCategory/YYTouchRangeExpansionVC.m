//
//  YYTouchRangeExpansionVC.m
//  YYCategory
//
//  Created by Mr.Pyy on 2017/7/11.
//  Copyright © 2017年 yuanyuan100. All rights reserved.
//

#import "YYTouchRangeExpansionVC.h"
#import <YYCategory/UIView+YYTouchRangeExpansion.h>

@interface YYTouchRangeExpansionVC ()
@property (weak, nonatomic) IBOutlet UIButton *cickBtn;

@end

@implementation YYTouchRangeExpansionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.cickBtn.yy_extendedTouch = YES;
    self.cickBtn.yy_extendedTouchEdge = UIEdgeInsetsMake(-100, -100, -100, -100);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)click:(id)sender {
    LITTLE_ALERT(nil, @"click");
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
