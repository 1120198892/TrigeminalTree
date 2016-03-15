//
//  BaseTreeCell.h
//  TrigeminalTree
//
//  Created by erice on 16/3/14.
//  Copyright © 2016年 erice. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseTreeItem.h"
@interface BaseTreeCell : UITableViewCell


@property (nonatomic, strong) UIButton *levelBtn;
@property (nonatomic, strong) UILabel *upLabel;
@property (nonatomic, strong) UILabel *btLabel;

- (void)bind:(BaseTreeItem *)treeItem;

@end
