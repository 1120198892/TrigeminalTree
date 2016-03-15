//
//  ViewController.m
//  TrigeminalTree
//
//  Created by erice on 16/3/15.
//  Copyright © 2016年 erice. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)NSMutableArray*dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

/*
 
使用方法
 
1  只要实现以下三个tableView的固定的代理方法
2  调用cell 的固定 赋值方法。 bind 不能更换，传入一个model 必须继承于 BaseTreeItem
3  cell 可以自定义，但是必须继承BaseTreeCell 父类里边的属性不能改变
4  datasourece 是数据源
 
*/



- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView separatorInsetCell:cell indexPath:indexPath inArray:self.dataSource];
}

- (BaseTreeCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *QIdentityCell = @"BaseTreeCell";
    
    BaseTreeCell *cell = [tableView dequeueReusableCellWithIdentifier:QIdentityCell];
    
    if (cell == nil)
    {
        cell = [[BaseTreeCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"BaseTreeCell"];
    }
    BaseTreeItem*item =[self.dataSource objectAtIndex:indexPath.row];
    [cell bind:item];
 
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView addRowsWithIndexPath:indexPath inArray:self.dataSource];
}


@end
