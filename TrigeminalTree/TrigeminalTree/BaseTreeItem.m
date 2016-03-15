//
//  BaseTreeItem.m
//  TrigeminalTree
//
//  Created by erice on 16/3/14.
//  Copyright © 2016年 erice. All rights reserved.
//

#import "BaseTreeItem.h"

@implementation BaseTreeItem
- (void)dealloc
{
    self.IsGuide = nil;
    self.SiteLevel = nil;
    self.CourseSiteList = nil;
    
    self.ExamSiteName = nil;
}

@end
