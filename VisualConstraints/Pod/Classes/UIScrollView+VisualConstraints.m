//
//  UIScrollView+VisualConstraints.m
//  Pods
//
//  Created by Catalina Turlea on 4/9/15.
//
//

#import "UIScrollView+VisualConstraints.h"
#import "UIView+VisualConstraints.h"

@implementation UIScrollView (VisualConstraints)

- (void)addConstraintsToAlignVerticalAllViews:(NSArray *)views {
    
    [[views firstObject] addConstraintsForVerticalOffset:0];
    
    [views enumerateObjectsUsingBlock:^(UIView *view, NSUInteger idx, BOOL *stop) {
        
        [view addConstraintsForEqualWidthToView:view.superview];
        if (idx == [views count] - 1) {
            return;
        }
        [view addConstraintsForVerticalOffset:0 toView:[views objectAtIndex:(idx+1)]];
        
    }];
    
    [[views lastObject] addConstraintsToAlignBottomWithOffset:0];
}

- (void)addConstraintsToAlignHorizontalAllViews:(NSArray *)views {
    
    [[views firstObject] addConstraintsToAlignLeftWithOffset:0];
    
    [views enumerateObjectsUsingBlock:^(UIView *view, NSUInteger idx, BOOL *stop) {
        
        [view addConstraintsForEqualHeightToView:view.superview];
        if (idx == [views count] - 1) {
            return;
        }
        [view addConstraintsForHorizontalOffset:0 toView:[views objectAtIndex:(idx + 1)]];
        
    }];
    
    [[views lastObject] addConstraintsToAlignRightWithOffset:0];
}

- (void)addConstraintsToFillHorizontalWithView:(UIView *)view {
    [self addConstraintsToAlignHorizontalAllViews:@[view]];
}

- (void)addConstraintsToFillVerticalWithView:(UIView *)view {
    [self addConstraintsToAlignVerticalAllViews:@[view]];
}

@end
