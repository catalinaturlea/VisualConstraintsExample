//
//  UIView+VisualConstraints.h
//  VisualConstraintsKit
//
//  Created by Catalina Turlea on 2/19/15.
//  Copyright (c) 2015 Catalina Turlea. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (VisualConstraints)

// Fill
- (void)addConstraintsToFillHorizontal;
- (void)addConstraintsToFillVertical;
- (void)addConstraintsToFillHorizontalWithLeftPadding:(CGFloat)leftPadding rightPadding:(CGFloat)rightPadding;
- (void)addConstraintsToFillVerticalWithTopPadding:(CGFloat)topPadding bottomPadding:(CGFloat)bottomPadding;

// Center
- (NSLayoutConstraint *)addConstraintsToCenterHorizontal;
- (NSLayoutConstraint *)addConstraintsToCenterHorizontalWithOffset:(CGFloat)offset;
- (NSLayoutConstraint *)addConstraintsToCenterVertical;
- (NSLayoutConstraint *)addConstraintsToCenterVerticalWithOffset:(CGFloat)offset;
- (void)addConstraintsToCenter;
- (void)addConstraintsToCenterHorizontalWithWidth:(CGFloat)width;

// Align
- (void)addConstraintsToAlignTopWithPadding:(CGFloat)topPadding height:(CGFloat)height;
- (void)addConstraintsToAlignLeftWithOffset:(CGFloat)offset;
- (void)addConstraintsToAlignRightWithOffset:(CGFloat)offset;
- (void)addConstraintsToAlignBottomWithOffset:(CGFloat)offset;
- (NSLayoutConstraint *)addConstraintsToAlignHorizontalCenterToView:(UIView *)otherView;
- (NSLayoutConstraint *)addConstraintsToAlignVerticalCenterToView:(UIView *)otherView offset:(CGFloat)offset;

- (NSLayoutConstraint *)addConstraintsForHeight:(CGFloat)height;
- (NSLayoutConstraint *)addConstraintsForWidth:(CGFloat)width;
- (void)addConstraintsForBottomSpace:(CGFloat)space;
- (void)addConstraintsForVerticalOffset:(CGFloat)verticalOffset;

// Other views connections
- (void)addConstraintsForVerticalOffset:(CGFloat)verticalOffset toView:(UIView *)otherView;
- (void)addConstraintsForHorizontalOffset:(CGFloat)horizontalOffset toView:(UIView *)otherView;

- (void)addConstraintsForEqualHeightToView:(UIView *)otherView;
- (void)addConstraintsForEqualWidthToView:(UIView *)otherView;

@end