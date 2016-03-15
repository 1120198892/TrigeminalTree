//
//  UITableViewCell+edge.m
//  TrigeminalTree
//
//  Created by erice on 16/3/15.
//  Copyright © 2016年 erice. All rights reserved.
//

#import "UITableViewCell+edge.h"

@implementation UITableViewCell (edge)


- (void)separatorLeft:(CGFloat)left
{
    if ([self respondsToSelector:@selector(setSeparatorInset:)]) {
        self.separatorInset = UIEdgeInsetsMake(0, left, 0, 0);
    }
    if ([self respondsToSelector:@selector(setLayoutMargins:)]) {
        self.layoutMargins = UIEdgeInsetsMake(0, left, 0, 0);
    }
}


@end
