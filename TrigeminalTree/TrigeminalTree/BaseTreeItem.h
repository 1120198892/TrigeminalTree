//
//  BaseTreeItem.h
//  TrigeminalTree
//
//  Created by erice on 16/3/14.
//  Copyright © 2016年 erice. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseTreeItem : NSObject

@property (nonatomic, strong) NSString *IsGuide;
@property (nonatomic, strong) NSString *SiteLevel;
@property (nonatomic, strong) NSMutableArray *CourseSiteList;
@property (nonatomic,strong) NSString *ExamSiteName; // 非必须属性
@property (nonatomic, assign) BOOL IsOpen;
@property (nonatomic, assign) BOOL IsEnd;





@end
