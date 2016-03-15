//
//  BaseTreeCell.m
//  TrigeminalTree
//
//  Created by erice on 16/3/14.
//  Copyright © 2016年 erice. All rights reserved.
//

#import "BaseTreeCell.h"

@implementation BaseTreeCell

- (void)awakeFromNib {
    
    self.upLabel = [[UILabel alloc] initWithFrame:CGRectMake(22, 0, kLine05, 16)];
    [self addSubview:self.upLabel];
    
    self.btLabel = [[UILabel alloc] initWithFrame:CGRectMake(22, 34, kLine05, 101)];
    [self addSubview:self.btLabel];
    
    self.clipsToBounds = YES;
    
    self.levelBtn = [[UIButton alloc] initWithFrame:CGRectMake(12, 15, 20, 20)];
    self.levelBtn.userInteractionEnabled = NO;
    [self addSubview:self.levelBtn];
    
    
    
}

- (void)bind:(BaseTreeItem *)treeItem
{
    if (![treeItem isKindOfClass:[BaseTreeItem class]]) {
        return;
    }
    if ([treeItem.IsGuide isEqualToString:@"1"]) {
        if (treeItem.CourseSiteList.count == 0) {
            self.levelBtn.imageName = @"chaptar_guide";
            [self upHidden:YES btHidden:YES isEnd:NO];
        }
    } else if ([treeItem.ExamSiteName isEqualToString:@"免费体验"]) {
        if (treeItem.CourseSiteList.count == 0) {    //此处为示例 特殊处理的方法
            self.levelBtn.imageName = @"chaptar_point";
            [self upHidden:YES btHidden:YES isEnd:NO];
        }
    } else {
        if ([treeItem.SiteLevel isEqualToString:@"1"]) {
            if (treeItem.CourseSiteList.count) {
                if (treeItem.IsOpen) {
                    self.levelBtn.imageName = @"chaptar_level1_h";
                    [self upHidden:YES btHidden:NO isEnd:NO];
                } else {
                    self.levelBtn.imageName = @"chaptar_level1_n";
                    [self upHidden:YES btHidden:YES isEnd:NO];
                }
            } else {
                self.levelBtn.imageName = @"chaptar_point";
                [self upHidden:YES btHidden:YES isEnd:NO];
            }
        } else if ([treeItem.SiteLevel isEqualToString:@"2"]) {
            if (treeItem.CourseSiteList.count) {
                if (treeItem.IsOpen) {
                    self.levelBtn.imageName = @"chaptar_jian";
                } else {
                    self.levelBtn.imageName = @"chaptar_jia";
                }
                [self upHidden:NO btHidden:treeItem.IsEnd isEnd:NO];
            } else {
                self.levelBtn.imageName = @"chaptar_point";
                [self upHidden:NO btHidden:treeItem.IsEnd isEnd:YES];
            }
        } else if ([treeItem.SiteLevel isEqualToString:@"3"]) {
            self.levelBtn.imageName = @"chaptar_point";
            [self upHidden:NO btHidden:treeItem.IsEnd isEnd:YES];
        }
    }
}

- (void)upHidden:(BOOL)upHidden btHidden:(BOOL)btHidden isEnd:(BOOL)isEnd
{
    self.upLabel.hidden = upHidden;
    self.btLabel.hidden = btHidden;
    
    if (isEnd) {
        self.upLabel.height = 22;
        self.btLabel.top = 28;
    } else {
        self.upLabel.height = 16;
        self.btLabel.top = 34;
    }
}





@end
