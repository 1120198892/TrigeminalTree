//
//  SingleHelper.m
//  TrigeminalTree
//
//  Created by erice on 16/3/21.
//  Copyright © 2016年 erice. All rights reserved.
//

#import "SingleHelper.h"

#define DISPATCH_ONCE_CLASS \
static id shared = nil; \
\
+ (instancetype)shared \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
shared = [[self alloc] init]; \
}); \
return shared; \
} \
\
+ (instancetype)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
shared = [super allocWithZone:zone]; \
}); \
return shared; \
} \




@implementation SingleHelper

DISPATCH_ONCE_CLASS

@end
