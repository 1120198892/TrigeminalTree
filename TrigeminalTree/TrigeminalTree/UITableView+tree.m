//
//  UITableView+tree.m
//  TrigeminalTree
//
//  Created by erice on 16/3/15.
//  Copyright © 2016年 erice. All rights reserved.
//

#import "UITableView+tree.h"

@implementation UITableView (tree)



- (void)separatorInsetCell:(UITableViewCell *)cell indexPath:(NSIndexPath *)indexPath inArray:(NSMutableArray *)dataSource
{
    id object = [dataSource objectAtIndex:indexPath.row];
    if ([object isKindOfClass:[BaseTreeItem class]]) {
        BaseTreeItem *siteItem = (BaseTreeItem *)object;
        if ([siteItem.SiteLevel isEqualToString:@"1"]) {
            if (siteItem.IsOpen) {
                [cell separatorLeft:40];
            } else {
                [cell separatorLeft:0];
            }
        } else {
            if (siteItem.IsEnd) {
                [cell separatorLeft:0];
            } else {
                [cell separatorLeft:40];
            }
        }
    } else {
        [cell separatorLeft:0];
    }
}

- (void)addRowsWithIndexPath:(NSIndexPath *)indexPath inArray:(NSMutableArray *)dataSource
{
    [self addRowsWithIndexPath:indexPath inArray:dataSource expandBlock:nil];
}

- (void)addRowsWithIndexPath:(NSIndexPath *)indexPath inArray:(NSMutableArray *)dataSource expandBlock:(IntBlock)expandBlock
{
    BaseTreeItem *siteItem = [dataSource objectAtIndex:indexPath.row];
    if (![siteItem isKindOfClass:[BaseTreeItem class]]) {
        return;
    }
    if ([siteItem.IsGuide isEqualToString:@"1"]) {
        return;
    }
    
    if ([siteItem.SiteLevel isEqualToString:@"1"]) {
        siteItem.IsEnd = YES;
    }
    
    if (siteItem.CourseSiteList.count) {
        BOOL isInserted = NO;
        for (BaseTreeItem *levelSiteItem in siteItem.CourseSiteList) {
            NSInteger index = [dataSource indexOfObjectIdenticalTo:levelSiteItem];
            isInserted = (index > 0 && index != NSIntegerMax);
            if(isInserted)
                break;
        }
        
        if(isInserted) {
            siteItem.IsOpen = NO;
            for (NSInteger i = 0; i < siteItem.CourseSiteList.count; i++) {
                BaseTreeItem *levelSiteItem = [siteItem.CourseSiteList objectAtIndex:i];
                if (i == siteItem.CourseSiteList.count - 1) {
                    if (levelSiteItem.IsEnd == YES) {
                        siteItem.IsEnd = YES;
                    } else {
                        siteItem.IsEnd = NO;
                    }
                }
            }
            [self reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            if (expandBlock) {
                expandBlock(-1);
            }
            [self romoveThisRows:siteItem.CourseSiteList inArray:dataSource indexPath:indexPath];
        } else {
            siteItem.IsOpen = YES;
            BOOL isEnd = siteItem.IsEnd;
            if ([siteItem.SiteLevel isEqualToString:@"2"]) {
                if (siteItem.IsEnd) {
                    siteItem.IsEnd = NO;
                }
            }
            [self reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            NSUInteger count = indexPath.row + 1;
            NSMutableArray *indexPaths = [NSMutableArray array];
            for (NSInteger i = 0; i < siteItem.CourseSiteList.count; i++) {
                BaseTreeItem *levelSiteItem = [siteItem.CourseSiteList objectAtIndex:i];
                [indexPaths addObject:[NSIndexPath indexPathForRow:count inSection:indexPath.section]];
                [dataSource insertObject:levelSiteItem atIndex:count++];
                if (i == siteItem.CourseSiteList.count - 1 && isEnd) {
                    levelSiteItem.IsEnd = YES;
                } else {
                    levelSiteItem.IsEnd = NO;
                }
            }
            if (expandBlock) {
                expandBlock(1);
            }
            [self insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationTop];
        }
    }
}

- (void)romoveThisRows:(NSMutableArray *)courseSiteList inArray:(NSMutableArray *)dataSource indexPath:(NSIndexPath *)indexPath
{
    for (BaseTreeItem *levelSiteItem in courseSiteList) {
        NSUInteger indexToRemove = [dataSource indexOfObjectIdenticalTo:levelSiteItem];
        if (levelSiteItem.CourseSiteList && [levelSiteItem.CourseSiteList count] > 0) {
            levelSiteItem.IsOpen = NO;
            levelSiteItem.IsEnd = NO;
            [self romoveThisRows:levelSiteItem.CourseSiteList inArray:dataSource indexPath:indexPath];
        }
        
        if ([dataSource indexOfObjectIdenticalTo:levelSiteItem] != NSNotFound) {
            [dataSource removeObjectIdenticalTo:levelSiteItem];
            sleep(0.0001);
            [self deleteRowsAtIndexPaths:[NSArray arrayWithObject:[NSIndexPath indexPathForRow:indexToRemove inSection:indexPath.section]]
                        withRowAnimation:UITableViewRowAnimationFade];
        }
    }
}



@end
