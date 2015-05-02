//
//  UIView+VisualConstraints.h
//  VisualConstraintsKit
//
//  Created by Catalina Turlea on 2/19/15.
//  Copyright (c) 2015 Catalina Turlea. All rights reserved.
//

@import UIKit;

/**
 *  Category to facilitate using the visual constraints format
 */
@interface UIView (VisualConstraints)

// Fill

/**
 *  Adds the constraints to fill the parent view horizontally
 */
- (void)addConstraintsToFillHorizontal;

/**
 *  Adds the constraints to fill the parent view vertically
 */
- (void)addConstraintsToFillVertical;

/**
 *  Adds constraints to fill the parent view horizontally with the given left and right padding
 *
 *  @param leftPadding
 *  @param rightPadding
 */
- (void)addConstraintsToFillHorizontalWithLeftPadding:(CGFloat)leftPadding rightPadding:(CGFloat)rightPadding;

/**
 *  Adds constraints to fill the parent view horizontally with the given top and bottom padding
 *
 *  @param topPadding
 *  @param bottomPadding
 */
- (void)addConstraintsToFillVerticalWithTopPadding:(CGFloat)topPadding bottomPadding:(CGFloat)bottomPadding;

// Center
/**
 *  Adds constraints to center horizontally in the parent view
 *
 *  @return the added constraint in case it is needed for animation later on
 */
- (NSLayoutConstraint *)addConstraintsToCenterHorizontal;

/**
 *  Adds constraints to center horizontally in the parent view with the given offset
 *
 *  @param offset
 *
 *  @return the added constraint in case it is needed for animation later on
 */
- (NSLayoutConstraint *)addConstraintsToCenterHorizontalWithOffset:(CGFloat)offset;

/**
 *  Adds constraints to center vertically in the parent view
 *
 *  @return the added constraint in case it is needed for animation later on
 */
- (NSLayoutConstraint *)addConstraintsToCenterVertical;

/**
 *  Adds constraints to center vertically in the parent view with the given offset
 *
 *  @param offset
 *
 *  @return the added constraint in case it is needed for animation later on
 */
- (NSLayoutConstraint *)addConstraintsToCenterVerticalWithOffset:(CGFloat)offset;

/**
 *  Adds the constraints to center both vertically and horizontally in the parent view
 */
- (void)addConstraintsToCenter;

/**
 *   Adds the constraints to center horizontally in the parent view and the ones to set the specific given width - should be used for views that do not have an instrinsic size (like UIView)
 *
 *  @param width
 */
- (void)addConstraintsToCenterHorizontalWithWidth:(CGFloat)width;

/**
 *  Adds the constraints to center vertically in the parent view and to set the given height - should be used for views that do not have an instrinsic size (like UIView)
 *
 *  @param height
 */
- (void)addConstraintsToCenterVerticalWithHeight:(CGFloat)height;

// Align

/**
 *  Adds the constraint for the top offset to the parent view
 *
 *  @param offset
 */
- (void)addConstraintsToAlignTopWithOffset:(CGFloat)offset;

/**
 *  Adds the constraint for the leading(left) offset to the parent view
 *
 *  @param offset
 */
- (void)addConstraintsToAlignLeftWithOffset:(CGFloat)offset;

/**
 *  Adds the constraint for the trailing(right) offset to the parent view
 *
 *  @param offset
 */
- (void)addConstraintsToAlignRightWithOffset:(CGFloat)offset;

/**
 *  Adds the constraint for the bottom offset to the parent view
 *
 *  @param offset
 */
- (void)addConstraintsToAlignBottomWithOffset:(CGFloat)offset;

/**
 *  Adds the constraint for the top offset to the parent view and the specified height
 *
 *  @param offset
 *  @param height
 */
- (void)addConstraintsToAlignTopWithOffset:(CGFloat)offset height:(CGFloat)height;

/**
 *  Adds the constraint for the leading(left) offset to the parent view and specified width
 *
 *  @param offset
 *  @param width
 */
- (void)addConstraintsToAlignLeftWithOffset:(CGFloat)offset width:(CGFloat)width;

/**
 *  Adds the constraint for the trailing(right) offset to the parent view and specified width
 *
 *  @param offset
 *  @param width
 */
- (void)addConstraintsToAlignRightWithOffset:(CGFloat)offset width:(CGFloat)width;

/**
 *  Adds the constraint for the bottom offset to the parent view and the specified height
 *
 *  @param offset
 *  @param height
 */
- (void)addConstraintsToAlignBottomWithOffset:(CGFloat)offset height:(CGFloat)height;

// Width & height

/**
 *  Adds the constraints for the sepcified height
 *
 *  @param height
 *
 *  @return the height constraint
 */
- (NSLayoutConstraint *)addConstraintsForHeight:(CGFloat)height;

/**
 *  Adds the constraint for the specified width
 *
 *  @param width
 *
 *  @return the width constraint
 */
- (NSLayoutConstraint *)addConstraintsForWidth:(CGFloat)width;

// Other views connections

/**
 *  Adds the constraint to set the specified vertical offset between the view and the given other view (the other view will appear under the current)
 *
 *  @param verticalOffset
 *  @param otherView
 */
- (void)addConstraintsForVerticalOffset:(CGFloat)verticalOffset toView:(UIView *)otherView;

/**
 *  Adds the constraint to set the specified horizontal offset between the view and the given other view
 *
 *  @param horizontalOffset
 *  @param otherView
 */
- (void)addConstraintsForHorizontalOffset:(CGFloat)horizontalOffset toView:(UIView *)otherView;

/**
 *  Adds constraints to for the same height as the other view
 *
 *  @param otherView
 */
- (void)addConstraintsForEqualHeightToView:(UIView *)otherView;

/**
 *  Adds constraints for the same width as the other view
 *
 *  @param otherView
 */
- (void)addConstraintsForEqualWidthToView:(UIView *)otherView;

/**
 *  Adds constraints to align the horizontal center with the other view
 *
 *  @param otherView
 *
 *  @return the added constraint
 */
- (NSLayoutConstraint *)addConstraintsToAlignHorizontalCenterToView:(UIView *)otherView;

/**
 *  Adds constraints to align the horizontal center with the other view with the given offset
 *
 *  @param otherView
 *  @param offset
 *
 *  @return the added constraint
 */
- (NSLayoutConstraint *)addConstraintsToAlignVerticalCenterToView:(UIView *)otherView offset:(CGFloat)offset;

- (void)debugConstraints;

- (BOOL)validateConstraints;
- (BOOL)validateHorizontalConstraints;
- (BOOL)validateVerticalConstraints;

- (NSDictionary *)horizontalConstraints;

@end