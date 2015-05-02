//
//  UIScrollView+VisualConstraints.h
//  Pods
//
//  Created by Catalina Turlea on 4/9/15.
//
//

#import <UIKit/UIKit.h>

@interface UIScrollView (VisualConstraints)

// Add a subview to the scrollView that will fill it - the scrollView will get it's content size depending on the width of the view
- (void)addConstraintsToFillHorizontalWithView:(UIView *)view;

// Add a subview to the scrollView that will fill it - the scrollView will get it's content size depending on the height of the view
- (void)addConstraintsToFillVerticalWithView:(UIView *)view;

// Align all subviews in the array one after the other in a vertical manner - fills the scrollView parent
- (void)addConstraintsToAlignVerticalAllViews:(NSArray *)views;

// Align all subviews in the array one after the other in a horizontal manner - fills the scrollView parent
- (void)addConstraintsToAlignHorizontalAllViews:(NSArray *)views;

// Align all subviews in the array one after the other in a vertical manner - fills the scrollView parent
- (void)addConstraintsToAlignVerticalAllViews:(NSArray *)views withOffset:(CGFloat)offset;

// Align all subviews in the array one after the other in a horizontal manner - fills the scrollView parent
- (void)addConstraintsToAlignHorizontalAllViews:(NSArray *)views withOffset:(CGFloat)offset;

@end
