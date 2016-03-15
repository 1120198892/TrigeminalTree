//
//  UIButton+image.m
//  TrigeminalTree
//
//  Created by erice on 16/3/15.
//  Copyright © 2016年 erice. All rights reserved.
//

#import "UIButton+image.h"
#import <objc/runtime.h>
@implementation UIButton (image)
@dynamic imageName,ImageNameHigh;


+ (void)load{
    
    [super load];
    
    Method fromMethod = class_getInstanceMethod([self class], @selector(setImageName:));
    
    Method toMethod = class_getInstanceMethod([self class], @selector(setImage:forState:));
    
    method_exchangeImplementations(fromMethod, toMethod);
    
}

- (void)setImageName:(NSString *)imageName{
   
    [self setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    
}

- (void)setImageNameHigh:(NSString *)ImageNameHigh{

    [self setImage:[UIImage imageNamed:ImageNameHigh] forState:UIControlStateHighlighted];
}

@end
