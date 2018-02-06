//
//  YYViewController.m
//  YYCategory
//
//  Created by yuanyuan100 on 07/11/2017.
//  Copyright (c) 2017 yuanyuan100. All rights reserved.
//

#import "YYViewController.h"
#import <YYCategoryKit/YYCategoryHeader.h>

#ifndef CELL_ARRAY
#define CELL_ARRAY @[@"YYTouchRangeExpansionVC", @"YYSeriesEventVC"]
#endif

@interface YYViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation YYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.tableView];
    
    NSArray *a = @[_tableView, _tableView];
    NSLog(@"%@", a);
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return CELL_ARRAY.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = CELL_ARRAY[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.navigationController pushViewController:[NSClassFromString(CELL_ARRAY[indexPath.row]) new] animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
