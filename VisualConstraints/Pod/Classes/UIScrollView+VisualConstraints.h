//
//  UIScrollView+VisualConstraints.h
//  Pods
//
//  Created by Catalina Turlea on 4/9/15.
//
//

#import <UIKit/UIKit.h>

@interface UIScrollView (VisualConstraints)

// Align all subviews in the array one after the other in a vertical manner - fills the scrollView parent
- (void)addConstraintsToAlignVerticalAllViews:(NSArray *)views;

// Align all subviews in the array one after the other in a horizontal manner - fills the scrollView parent
- (void)addConstraintsToAlignHorizontalAllViews:(NSArray *)views;

- (void)addConstraintsToFillHorizontalWithView:(UIView *)view;

- (void)addConstraintsToFillVerticalWithView:(UIView *)view;

@end
