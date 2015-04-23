//
//  UIScrollView+VisualConstraints.h
//  Pods
//
//  Created by Catalina Turlea on 4/9/15.
//
//

#import <UIKit/UIKit.h>

@interface UIScrollView (VisualConstraints)

// Align all subviews in array one after the other in a vertical manner
- (void)addConstraintsToAlignVerticalAllViews:(NSArray *)views;

// Align all subviews in array one after the other in a horizontal manner
- (void)addConstraintsToAlignHorizontalAllViews:(NSArray *)views;

@end
