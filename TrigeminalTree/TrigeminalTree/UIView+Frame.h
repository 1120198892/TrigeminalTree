//
//  UIView+Frame.h
//  TrigeminalTree
//
//  Created by erice on 16/3/15.
//  Copyright © 2016年 erice. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIView (Frame)

@property CGPoint origin;
@property CGSize size;

@property (readonly) CGPoint bottomLeft;
@property (readonly) CGPoint bottomRight;
@property (readonly) CGPoint topRight;

@property CGFloat height;
@property CGFloat width;
@property CGFloat centerx;
@property CGFloat centery;
@property CGFloat top;
@property CGFloat left;

@property CGFloat bottom;
@property CGFloat right;

- (void) moveBy: (CGPoint) delta;
- (void) scaleBy: (CGFloat) scaleFactor;
- (void) fitInSize: (CGSize) aSize;

@end
