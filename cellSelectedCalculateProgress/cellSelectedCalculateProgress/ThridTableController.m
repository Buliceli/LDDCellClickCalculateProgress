//
//  ThridTableController.m
//  testCopods
//
//  Created by 李洞洞 on 9/8/17.
//  Copyright © 2017年 Minte. All rights reserved.
/**
 
 点了当前控制器的cell为一次有效点击 除以 当前cell的总个数 算出第二级控制器中cell上的进度值
 
 需要考虑到第一级控制器上的点击的那个cell推出的第二级控制器 和第三极控制器上的cell重复点击是不算的
 
 */

#import "ThridTableController.h"
@interface ThridTableController ()
@end

@implementation ThridTableController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"reuseIdentifier"];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier" forIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"第 %d 行",indexPath.row];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //三个tableView  三个层级关系 排列组合
    NSLog(@"%@ - %@",self.previousIdentifider,self.identifier);
    NSString * selectedRow = [NSString stringWithFormat:@"%d",indexPath.row];
    
    //点过的数组要存的东西应该是个完整的路径
    NSString * key = [NSString stringWithFormat:@"%@/%@/%@",self.previousIdentifider,self.identifier,selectedRow];
    //用来表示点过的数组对应的key 那这个key呢也一定和之前的层级目录联系起来..
    NSString * key1 = [NSString stringWithFormat:@"%@/%@",self.previousIdentifider,self.identifier];
    //点过对应的数组持久化存储
    NSMutableArray * selectedArr = [NSMutableArray arrayWithArray:[[NSUserDefaults standardUserDefaults]objectForKey:key1]];
  
    NSLog(@"存前:%@",selectedArr);
    
    if (![selectedArr containsObject:key]) {
        [selectedArr addObject:key];
    }
    NSLog(@"存后:%@",selectedArr);
    
    [[NSUserDefaults standardUserDefaults]setObject:selectedArr forKey:key1];
    //计算进度相关
    CGFloat progress = selectedArr.count / 10.0;//10是数组个数
    NSString * progressKey = [NSString stringWithFormat:@"%@-%@",self.previousIdentifider,self.identifier];//相同的key会覆盖 所以进度单设一个key 那这个key呢也一定和之前的层级目录联系起来..
    NSDictionary * dict = @{progressKey:@(progress)};
    
    [[NSUserDefaults standardUserDefaults]setObject:dict forKey:progressKey];
}

@end
