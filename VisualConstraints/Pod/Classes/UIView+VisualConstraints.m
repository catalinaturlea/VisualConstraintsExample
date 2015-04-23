//
//  UIView+VisualConstraints.m
//  VisualConstraintsKit
//
//  Created by Catalina Turlea on 2/19/15.
//  Copyright (c) 2015 Catalina Turlea. All rights reserved.
//

#import "UIView+VisualConstraints.h"

@implementation UIView (VisualConstraints)

- (void)addConstraintsToFillHorizontal {
    [self addConstraintsToFillHorizontalWithLeftPadding:0 rightPadding:0];
}

- (void)addConstraintsToFillVertical {
    [self addConstraintsToFillVerticalWithTopPadding:0 bottomPadding:0];
}

- (NSLayoutConstraint *)addConstraintsToCenterHorizontal {
    return [self addConstraintsToCenterHorizontalWithOffset:0];
}

- (NSLayoutConstraint *)addConstraintsToCenterHorizontalWithOffset:(CGFloat)offset {
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *centerXConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeCenterX multiplier:1.f constant:offset];
    [self.superview addConstraint:centerXConstraint];
    return centerXConstraint;
}

- (NSLayoutConstraint *)addConstraintsToCenterVertical {
    return [self addConstraintsToCenterVerticalWithOffset:0];
}

- (NSLayoutConstraint *)addConstraintsToCenterVerticalWithOffset:(CGFloat)offset {
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *centerYConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeCenterX multiplier:1.f constant:offset];
    [self.superview addConstraint:centerYConstraint];
    return centerYConstraint;
}

- (void)addConstraintsToCenter {
    [self addConstraintsToCenterVertical];
    [self addConstraintsToCenterHorizontal];
}

- (void)addConstraintsToCenterHorizontalWithWidth:(CGFloat)width {
    [self addConstraintsToCenterHorizontal];
    [self.superview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[view(==width)]" options:0 metrics:@{ @"width": [NSNumber numberWithFloat:width] } views:@{ @"view": self }]];
}

- (void)addConstraintsToFillHorizontalWithLeftPadding:(CGFloat)leftPadding rightPadding:(CGFloat)rightPadding {
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.superview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-leftPadding-[childView]-rightPadding-|" options:0 metrics:@{ @"rightPadding":@(rightPadding), @"leftPadding": @(leftPadding) } views:@{ @"childView": self }]];
}

- (void)addConstraintsToFillVerticalWithTopPadding:(CGFloat)topPadding bottomPadding:(CGFloat)bottomPadding {
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.superview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-topPadding-[childView]-bottomPadding-|" options:0 metrics:@{ @"bottomPadding":@(bottomPadding), @"topPadding": @(topPadding) } views:@{ @"childView": self }]];
}

- (void)addConstraintsToAlignTopWithPadding:(CGFloat)topPadding height:(CGFloat)height {
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.superview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-topPadding-[childView(==height)]" options:0 metrics:@{ @"topPadding": @(topPadding), @"height": @(height) } views:@{ @"childView": self }]];
}

- (NSLayoutConstraint *)addConstraintsForHeight:(CGFloat)height {
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[view(==height)]" options:0 metrics:@{ @"height": [NSNumber numberWithFloat:height] } views:@{ @"view": self }];
    [self.superview addConstraints:constraints];
    return [constraints firstObject];
}

- (void)addConstraintsForBottomSpace:(CGFloat)space {
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.superview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[view]-space-|" options:0 metrics:@{ @"space": [NSNumber numberWithFloat:space] } views:@{ @"view": self }]];
}

- (NSLayoutConstraint *)addConstraintsForWidth:(CGFloat)width {
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[view(==width)]" options:0 metrics:@{ @"width": [NSNumber numberWithFloat:width] } views:@{ @"view": self }];
    
    [self.superview addConstraints:constraints];
    return [constraints firstObject];
}

- (void)addConstraintsForVerticalOffset:(CGFloat)verticalOffset {
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.superview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-verticalOffset-[view]" options:0 metrics:@{ @"verticalOffset": [NSNumber numberWithFloat:verticalOffset] } views:@{ @"view": self }]];
}

- (void)addConstraintsToAlignLeftWithOffset:(CGFloat)offset {
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.superview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-offset-[view]" options:0 metrics:@{ @"offset": [NSNumber numberWithFloat:offset] } views:@{ @"view": self }]];
}

- (void)addConstraintsToAlignRightWithOffset:(CGFloat)offset {
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.superview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[view]-offset-|" options:0 metrics:@{ @"offset": [NSNumber numberWithFloat:offset] } views:@{ @"view": self }]];
}

- (void)addConstraintsToAlignBottomWithOffset:(CGFloat)offset {
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.superview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[view]-offset-|" options:0 metrics:@{ @"offset": [NSNumber numberWithFloat:offset] } views:@{ @"view": self }]];
}

- (void)addConstraintsForVerticalOffset:(CGFloat)verticalOffset toView:(UIView *)otherView {
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.superview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[view]-verticalOffset-[otherView]" options:0 metrics:@{ @"verticalOffset": [NSNumber numberWithFloat:verticalOffset] } views:@{ @"view": self,  @"otherView": otherView }]];
}

- (void)addConstraintsForHorizontalOffset:(CGFloat)horizontalOffset toView:(UIView *)otherView {
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.superview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[view]-horizontalOffset-[otherView]" options:0 metrics:@{ @"horizontalOffset": [NSNumber numberWithFloat:horizontalOffset] } views:@{ @"view": self,  @"otherView": otherView }]];
}

- (NSLayoutConstraint *)addConstraintsToAlignHorizontalCenterToView:(UIView *)otherView {
    return [self addConstraintsToAlignHorizontalCenterToView:otherView offset:0];
}

- (NSLayoutConstraint *)addConstraintsToAlignHorizontalCenterToView:(UIView *)otherView offset:(CGFloat)offset {
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *centerXConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:otherView attribute:NSLayoutAttributeCenterX multiplier:1.f constant:offset];
    [self.superview addConstraint:centerXConstraint];
    return centerXConstraint;
}

- (NSLayoutConstraint *)addConstraintsToAlignVerticalCenterToView:(UIView *)otherView offset:(CGFloat)offset {
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *centerYConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:otherView attribute:NSLayoutAttributeCenterY multiplier:1.f constant:offset];
    [self.superview addConstraint:centerYConstraint];
    return centerYConstraint;
}

- (void)addConstraintsForEqualHeightToView:(UIView *)otherView {
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:otherView attribute:NSLayoutAttributeHeight multiplier:1 constant:0];
    [self.superview addConstraint:constraint];
}

- (void)addConstraintsForEqualWidthToView:(UIView *)otherView {
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:otherView attribute:NSLayoutAttributeWidth multiplier:1 constant:0];
    [self.superview addConstraint:constraint];
}

@end
