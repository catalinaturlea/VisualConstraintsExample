//
//  UIView+VisualConstraints.h
//  VisualConstraintsKit
//
//  Created by Catalina Turlea on 2/19/15.
//  Copyright (c) 2015 Catalina Turlea. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (VisualConstraints)

- (void)addConstraintsToFillSuperview;
- (void)addConstraintsToVerticalFillSuperview;
- (NSLayoutConstraint *)addConstraintsToCenterHorizontalInSuperview;
- (NSLayoutConstraint *)addConstraintsToCenterHorizontalInSuperviewWithOffset:(CGFloat)offset;
- (NSLayoutConstraint *)addConstraintsToVerticalCenterInSuperview;
- (NSLayoutConstraint *)addConstraintsToVerticalCenterInSuperviewWithOffset:(CGFloat)offset;
- (void)addConstraintsToCenterInSuperview ;
- (void)addConstraintsToCenterHorizontalInSupervieWithWidth:(CGFloat)width;
- (void)addConstraintsToHorizontalFillSuperviewWithLeftPadding:(CGFloat)leftPadding andRightPadding:(CGFloat)rightPadding;
- (void)addConstraintsToVerticalFillSuperviewWithTopPadding:(CGFloat)topPadding andBottomPadding:(CGFloat)bottomPadding;
- (void)addConstraintsToAlignTopInSupervewWithTopPadding:(CGFloat)topPadding andHeight:(CGFloat)height;
- (void)addConstraintsToVerticallyAlignWithBottomOffset:(CGFloat)bottomOffset andHeight:(CGFloat)height;
- (NSArray *)addConstraintsForHeight:(CGFloat)height;
- (void)addConstraintsForBottomSpace:(CGFloat)space;
- (void)addConstraintsForWidth:(CGFloat)width;
- (void)addConstraintsForVerticalOffset:(CGFloat)verticalOffset;
- (void)addConstraintsToAlignLeftWithOffset:(CGFloat)offset;
- (void)addConstraintsToAlignRightWithOffset:(CGFloat)offset;
- (void)addConstraintsToAlignBottomWithOffset:(CGFloat)offset;
- (void)addConstraintsForVerticalOffset:(CGFloat)verticalOffset toView:(UIView *)otherView;
- (void)addConstraintsForHorizontalOffset:(CGFloat)horizontalOffset toView:(UIView *)otherView;
- (NSLayoutConstraint *)addConstraintsToHorizontallyAlignCenterIntoView:(UIView *)otherView;
- (NSLayoutConstraint *)addConstraintsToVerticallyAlignCenterIntoView:(UIView *)otherView forOffset:(CGFloat)offset;
- (void)addConstraintsForEqualsHeightsWithView:(UIView *)otherView;
- (void)addConstraintsForEqualsWidthsWidthView:(UIView *)otherView;

@end