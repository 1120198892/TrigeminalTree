//
//  UITableView+tree.h
//  TrigeminalTree
//
//  Created by erice on 16/3/15.
//  Copyright © 2016年 erice. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^IntBlock)(NSInteger index);

@interface UITableView (tree)

- (void)separatorInsetCell:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath inArray:(NSMutableArray *)dataSource;
- (void)addRowsWithIndexPath:(NSIndexPath *)indexPath inArray:(NSMutableArray *)dataSource;
- (void)addRowsWithIndexPath:(NSIndexPath *)indexPath inArray:(NSMutableArray *)dataSource expandBlock:(IntBlock)expandBlock;


@end
