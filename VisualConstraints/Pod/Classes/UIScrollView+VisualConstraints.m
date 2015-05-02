//
//  UIScrollView+VisualConstraints.m
//  Pods
//
//  Created by Catalina Turlea on 4/9/15.
//
//

#import "UIScrollView+VisualConstraints.h"
#import "VisualConstraints.h"

@implementation UIScrollView (VisualConstraints)

- (void)addConstraintsToFillHorizontalWithView:(UIView *)view
{
    [self addConstraintsToAlignHorizontalAllViews:@[view]];
}

- (void)addConstraintsToFillVerticalWithView:(UIView *)view
{
    [self addConstraintsToAlignVerticalAllViews:@[view]];
}

- (void)addConstraintsToAlignVerticalAllViews:(NSArray *)views
{
    [self addConstraintsToAlignVerticalAllViews:views withOffset:0];
}

- (void)addConstraintsToAlignHorizontalAllViews:(NSArray *)views
{
    [self addConstraintsToAlignHorizontalAllViews:views withOffset:0];
}

- (void)addConstraintsToAlignVerticalAllViews:(NSArray *)views withOffset:(CGFloat)offset
{
    [[views firstObject] addConstraintsToAlignTopWithOffset:offset];
    
    [views enumerateObjectsUsingBlock:^(UIView *view, NSUInteger idx, BOOL *stop) {
        [view addConstraintsToAlignLeftWithOffset:0];
        [view addConstraintsForEqualWidthToView:view.superview];
        if (idx == [views count] - 1)
        {
            return;
        }
        [view addConstraintsForVerticalOffset:offset toView:[views objectAtIndex:(idx + 1)]];
    }];
    
    [[views lastObject] addConstraintsToAlignBottomWithOffset:offset];
    
    DDLogDebug(@"Added constraints to vertical align views");
}

- (void)addConstraintsToAlignHorizontalAllViews:(NSArray *)views withOffset:(CGFloat)offset
{
    [[views firstObject] addConstraintsToAlignLeftWithOffset:offset];
    
    [views enumerateObjectsUsingBlock:^(UIView *view, NSUInteger idx, BOOL *stop) {
        [view addConstraintsToAlignTopWithOffset:0];
        [view addConstraintsForEqualHeightToView:view.superview];
        if (idx == [views count] - 1)
        {
            return;
        }
        [view addConstraintsForHorizontalOffset:offset toView:[views objectAtIndex:(idx + 1)]];
    }];
    
    [[views lastObject] addConstraintsToAlignRightWithOffset:offset];
}

@end
