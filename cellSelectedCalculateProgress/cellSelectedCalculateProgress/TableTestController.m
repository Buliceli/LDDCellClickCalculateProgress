//
//  TableTestController.m
//  testCopods
//
//  Created by 李洞洞 on 9/8/17.
//  Copyright © 2017年 Minte. All rights reserved.
//

#import "TableTestController.h"
#import "TwoTableController.h"
@interface TableTestController ()

@end

@implementation TableTestController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reuseIdentifier"];
}
#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"第%d行",indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    TwoTableController * two = [[TwoTableController alloc]initWithStyle:UITableViewStylePlain];
    two.twoIdentifider = [NSString stringWithFormat:@"二级控制器 %d",indexPath.row];
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:two];
    [self presentViewController:nav animated:YES completion:nil];
}
@end
