//
//  UIView+VisualConstraints.m
//  VisualConstraintsKit
//
//  Created by Catalina Turlea on 2/19/15.
//  Copyright (c) 2015 Catalina Turlea. All rights reserved.
//

#import "UIView+VisualConstraints.h"

@implementation UIView (VisualConstraints)

- (void)addConstraintsToFillSuperview
{
    [self.superview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view]|" options:0 metrics:nil views:@{ @"view": self }]];
}

- (void)addConstraintsToVerticalFillSuperview
{
    [self.superview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]|" options:0 metrics:nil views:@{ @"view": self }]];
}

- (void)addConstraintsToVerticalFillSuperviewWithOffset:(CGFloat)offset
{
    [self.superview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]-offset-|" options:0 metrics:@{ @"offset": [NSNumber numberWithFloat:offset] } views:@{ @"view": self }]];
}

- (NSLayoutConstraint *)addConstraintsToCenterHorizontalInSuperview
{
    return [self addConstraintsToCenterHorizontalInSuperviewWithOffset:0];
}

- (NSLayoutConstraint *)addConstraintsToCenterHorizontalInSuperviewWithOffset:(CGFloat)offset
{
    NSLayoutConstraint *centerXConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeCenterX multiplier:1.f constant:offset];
    [self.superview addConstraint:centerXConstraint];
    return centerXConstraint;
}


- (NSLayoutConstraint *)addConstraintsToVerticalCenterInSuperview
{
    return [self addConstraintsToVerticalCenterInSuperviewWithOffset:0];
}

- (NSLayoutConstraint *)addConstraintsToVerticalCenterInSuperviewWithOffset:(CGFloat)offset
{
    NSLayoutConstraint *centerYConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeCenterX multiplier:1.f constant:offset];
    [self.superview addConstraint:centerYConstraint];
    return centerYConstraint;
}

- (void)addConstraintsToCenterInSuperview
{
    [self addConstraintsToCenterHorizontalInSuperview];
    [self addConstraintsToVerticalCenterInSuperview];
}

- (void)addConstraintsToCenterHorizontalInSuperviewithWidth:(CGFloat)width
{
    [self addConstraintsToCenterHorizontalInSuperview];
    
    [self.superview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[view(==width)]" options:0 metrics:@{ @"width": [NSNumber numberWithFloat:width ] } views:@{ @"view": self }]];
}

- (void)addConstraintsToHorizontalFillSuperviewWithLeftPadding:(CGFloat)leftPadding andRightPadding:(CGFloat)rightPadding
{
    [self.superview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-leftPadding-[childView]-rightPadding-|" options:0 metrics:@{ @"rightPadding":@(rightPadding), @"leftPadding": @(leftPadding) } views:@{ @"childView": self }]];
}

- (void)addConstraintsToVerticalFillSuperviewWithTopPadding:(CGFloat)topPadding andBottomPadding:(CGFloat)bottomPadding
{
    [self.superview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-topPadding-[childView]-bottomPadding-|" options:0 metrics:@{ @"bottomPadding":@(bottomPadding), @"topPadding": @(topPadding) } views:@{ @"childView": self }]];
}

- (void)addConstraintsToAlignTopInSupervewWithTopPadding:(CGFloat)topPadding andHeight:(CGFloat)height
{
    [self.superview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-topPadding-[childView(==height)]" options:0 metrics:@{ @"topPadding": @(topPadding), @"height": @(height) } views:@{ @"childView": self }]];
}

- (void)addConstraintsToVerticallyAlignInParent:(UIView *)parentView withBottomOffset:(CGFloat)bottomOffset andHeight:(CGFloat)height
{
    [parentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[childView(==height)]-bottomOffset-|"
                                                                       options:0
                                                                       metrics:@{ @"bottomOffset": [NSNumber numberWithFloat:bottomOffset], @"height": [NSNumber numberWithFloat:height] }
                                                                         views:@{ @"childView": self }]];
}

- (NSArray *)addConstraintsToParentView:(UIView *)parentView forHeight:(CGFloat)height
{
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[view(==height)]" options:0 metrics:@{ @"height": [NSNumber numberWithFloat:height] } views:@{ @"view": self }];
    [parentView addConstraints:constraints];
    return constraints;
}

- (void)addConstraintsToParentView:(UIView *)parentView forBottomSpace:(CGFloat)space
{
    [parentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[view]-space-|" options:0 metrics:@{ @"space": [NSNumber numberWithFloat:space] } views:@{ @"view": self }]];
}

- (void)addConstraintsToParentView:(UIView *)parentView forWidth:(CGFloat)width
{
    [parentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[view(==width)]" options:0 metrics:@{ @"width": [NSNumber numberWithFloat:width] } views:@{ @"view": self }]];
}

- (void)addConstraintsToParentView:(UIView *)parentView forVerticalOffset:(CGFloat)verticalOffset
{
    [parentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-verticalOffset-[view]" options:0 metrics:@{ @"verticalOffset": [NSNumber numberWithFloat:verticalOffset] } views:@{ @"view": self }]];
}

- (void)addConstraintsToAlignLeftInParent:(UIView *)parentView withOffset:(CGFloat)offset
{
    [parentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-offset-[view]" options:0 metrics:@{ @"offset": [NSNumber numberWithFloat:offset] } views:@{ @"view": self }]];
}

- (void)addConstraintsToAlignRightInParent:(UIView *)parentView withOffset:(CGFloat)offset
{
    [parentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[view]-offset-|" options:0 metrics:@{ @"offset": [NSNumber numberWithFloat:offset] } views:@{ @"view": self }]];
}

- (NSArray *)addConstraintsToAlignTopInParent:(UIView *)parentView withOffset:(CGFloat)offset
{
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-offset-[view]" options:0 metrics:@{ @"offset": [NSNumber numberWithFloat:offset] } views:@{ @"view": self }];
    [parentView addConstraints:constraints];
    return constraints;
}

- (void)addConstraintsToAlignBottomInParent:(UIView *)parentView withOffset:(CGFloat)offset
{
    [parentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[view]-offset-|" options:0 metrics:@{ @"offset": [NSNumber numberWithFloat:offset] } views:@{ @"view": self }]];
}

- (void)addConstraintsToParentView:(UIView *)parentView forVerticalOffset:(CGFloat)verticalOffset toView:(UIView *)otherView
{
    [parentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[view]-verticalOffset-[otherView]" options:0 metrics:@{ @"verticalOffset": [NSNumber numberWithFloat:verticalOffset] } views:@{ @"view": self,  @"otherView": otherView }]];
}

- (void)addConstraintsToParentView:(UIView *)parentView forHorizontalOffset:(CGFloat)horizontalOffset toView:(UIView *)otherView
{
    [parentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[view]-horizontalOffset-[otherView]" options:0 metrics:@{ @"horizontalOffset": [NSNumber numberWithFloat:horizontalOffset] } views:@{ @"view": self,  @"otherView": otherView }]];
}

- (NSLayoutConstraint *)addConstraintsToHorizontallyAlignCenterInParent:(UIView *)parentView toView:(UIView *)otherView
{
    NSLayoutConstraint *centerXConstraint = [NSLayoutConstraint constraintWithItem:self
                                                                         attribute:NSLayoutAttributeCenterX
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:otherView
                                                                         attribute:NSLayoutAttributeCenterX
                                                                        multiplier:1.f constant:0.f];
    [parentView addConstraint:centerXConstraint];
    return centerXConstraint;
}

- (NSLayoutConstraint *)addConstraintsToVerticallyAlignCenterInParent:(UIView *)parentView toView:(UIView *)otherView forOffset:(CGFloat)offset
{
    NSLayoutConstraint *centerYConstraint = [NSLayoutConstraint constraintWithItem:self
                                                                         attribute:NSLayoutAttributeCenterY
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:otherView
                                                                         attribute:NSLayoutAttributeCenterY
                                                                        multiplier:1.f constant:offset];
    [parentView addConstraint:centerYConstraint];
    return centerYConstraint;
}

- (void)addConstraintsForEqualsHeightsInParent:(UIView *)parentView toView:(UIView *)otherView
{
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self
                                                                  attribute:NSLayoutAttributeHeight
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:otherView
                                                                  attribute:NSLayoutAttributeHeight
                                                                 multiplier:1
                                                                   constant:0];
    [parentView addConstraint:constraint];
}

- (void)addConstraintsForEqualsWidthsInParent:(UIView *)parentView toView:(UIView *)otherView
{
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self
                                                                  attribute:NSLayoutAttributeWidth
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:otherView
                                                                  attribute:NSLayoutAttributeWidth
                                                                 multiplier:1
                                                                   constant:0];
    [parentView addConstraint:constraint];
}

@end
