//
//  TwoTableController.m
//  testCopods
//
//  Created by 李洞洞 on 9/8/17.
//  Copyright © 2017年 Minte. All rights reserved.
//

#import "TwoTableController.h"
#import "TwoTableCell.h"
#import "ThridTableController.h"
@interface TwoTableController ()

@end

@implementation TwoTableController
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:@"TwoTableCell" bundle:nil] forCellReuseIdentifier:@"cellID"];
    self.navigationItem.leftBarButtonItem = nil;
    UIBarButtonItem * item = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(leftItemClick)];
    self.navigationItem.leftBarButtonItem = item;
}
- (void)leftItemClick
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TwoTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    
    NSString * currentKey = [NSString stringWithFormat:@"%@-%@",self.twoIdentifider,[NSString stringWithFormat:@"%ld",(long)indexPath.row]];
    
    NSDictionary * dict = [[NSUserDefaults standardUserDefaults]objectForKey:currentKey];
    
    NSNumber *progress = dict[currentKey];
    CGFloat currentP = [progress floatValue];
    
    cell.progressView.progress = currentP;
    cell.progressLabel.text = [NSString stringWithFormat:@"%.2f",cell.progressView.progress];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 155;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ThridTableController * thir = [[ThridTableController alloc]init];
    thir.identifier = [NSString stringWithFormat:@"%d",indexPath.row];
    thir.previousIdentifider = self.twoIdentifider;
    [self.navigationController pushViewController:thir animated:YES];
}

@end
