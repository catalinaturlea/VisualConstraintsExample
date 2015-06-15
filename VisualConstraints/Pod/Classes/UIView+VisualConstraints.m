//
//  UIView+VisualConstraints.m
//  VisualConstraintsKit
//
//  Created by Catalina Turlea on 2/19/15.
//  Copyright (c) 2015 Catalina Turlea. All rights reserved.
//

#import "UIView+VisualConstraints.h"
#import "VisualConstraints.h"

static NSString *left = @"left";
static NSString *right = @"right";
static NSString *top = @"top";
static NSString *bottom = @"bottom";

@implementation UIView (VisualConstraints)

#pragma mark -
#pragma mark - Fill superview

- (void)addConstraintsToFillHorizontal
{
    [self addConstraintsToFillHorizontalWithLeftPadding:0 rightPadding:0];
}

- (void)addConstraintsToFillVertical
{
    [self addConstraintsToFillVerticalWithTopPadding:0 bottomPadding:0];
}

- (void)addConstraintsToFillHorizontalWithLeftPadding:(CGFloat)leftPadding rightPadding:(CGFloat)rightPadding
{
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.superview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-leftPadding-[childView]-rightPadding-|" options:0 metrics:@{ @"rightPadding":@(rightPadding), @"leftPadding": @(leftPadding) } views:@{ @"childView": self }]];
}

- (void)addConstraintsToFillVerticalWithTopPadding:(CGFloat)topPadding bottomPadding:(CGFloat)bottomPadding
{
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.superview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-topPadding-[childView]-bottomPadding-|" options:0 metrics:@{ @"bottomPadding":@(bottomPadding), @"topPadding": @(topPadding) } views:@{ @"childView": self }]];
}

#pragma mark -
#pragma mark - Center in superview

- (void)addConstraintsToCenter
{
    [self addConstraintsToCenterVertical];
    [self addConstraintsToCenterHorizontal];
}

- (void)addConstraintsToCenterHorizontalWithWidth:(CGFloat)width
{
    [self addConstraintsToCenterHorizontal];
    [self addConstraintsForWidth:width];
}

- (void)addConstraintsToCenterVerticalWithHeight:(CGFloat)height
{
    [self addConstraintsToCenterVertical];
    [self addConstraintsForHeight:height];
}

- (NSLayoutConstraint *)addConstraintsToCenterHorizontal
{
    return [self addConstraintsToCenterHorizontalWithOffset:0];
}

- (NSLayoutConstraint *)addConstraintsToCenterVertical
{
    return [self addConstraintsToCenterVerticalWithOffset:0];
}

- (NSLayoutConstraint *)addConstraintsToCenterHorizontalWithOffset:(CGFloat)offset
{
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *centerXConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeCenterX multiplier:1.f constant:offset];
    [self.superview addConstraint:centerXConstraint];
    return centerXConstraint;
}

- (NSLayoutConstraint *)addConstraintsToCenterVerticalWithOffset:(CGFloat)offset
{
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *centerYConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.superview attribute:NSLayoutAttributeCenterY multiplier:1.f constant:offset];
    [self.superview addConstraint:centerYConstraint];
    return centerYConstraint;
}

#pragma mark -
#pragma mark - Align in superview

- (void)addConstraintsToAlignTopWithOffset:(CGFloat)offset
{
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.superview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-offset-[childView]" options:0 metrics:@{ @"offset": @(offset) } views:@{ @"childView": self }]];
}

- (void)addConstraintsToAlignLeftWithOffset:(CGFloat)offset
{
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.superview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-offset-[view]" options:0 metrics:@{ @"offset": [NSNumber numberWithFloat:offset] } views:@{ @"view": self }]];
}

- (void)addConstraintsToAlignRightWithOffset:(CGFloat)offset
{
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.superview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[view]-offset-|" options:0 metrics:@{ @"offset": [NSNumber numberWithFloat:offset] } views:@{ @"view": self }]];
}

- (void)addConstraintsToAlignBottomWithOffset:(CGFloat)offset
{
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.superview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[view]-offset-|" options:0 metrics:@{ @"offset": [NSNumber numberWithFloat:offset] } views:@{ @"view": self }]];
}

- (void)addConstraintsToAlignTopWithOffset:(CGFloat)offset height:(CGFloat)height
{
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.superview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-offset-[childView(==height)]" options:0 metrics:@{ @"offset": @(offset), @"height": @(height) } views:@{ @"childView": self }]];
}

- (void)addConstraintsToAlignBottomWithOffset:(CGFloat)offset height:(CGFloat)height
{
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.superview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[childView(==height)]-offset-|" options:0 metrics:@{ @"offset": @(offset), @"height": @(height) } views:@{ @"childView": self }]];
}

- (void)addConstraintsToAlignLeftWithOffset:(CGFloat)offset width:(CGFloat)width
{
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.superview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-offset-[childView(==width)]" options:0 metrics:@{ @"offset": @(offset), @"width": @(width) } views:@{ @"childView": self }]];
}

- (void)addConstraintsToAlignRightWithOffset:(CGFloat)offset width:(CGFloat)width
{
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.superview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[childView(==width)]-offset-|" options:0 metrics:@{ @"offset": @(offset), @"width": @(width) } views:@{ @"childView": self }]];
}

#pragma mark -
#pragma mark - Width/ Height

- (NSLayoutConstraint *)addConstraintsForHeight:(CGFloat)height
{
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[view(==height)]" options:0 metrics:@{ @"height": [NSNumber numberWithFloat:height] } views:@{ @"view": self }];
    [self.superview addConstraints:constraints];
    return [constraints firstObject];
}

- (NSLayoutConstraint *)addConstraintsForWidth:(CGFloat)width
{
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:[view(==width)]" options:0 metrics:@{ @"width": [NSNumber numberWithFloat:width] } views:@{ @"view": self }];
    
    [self.superview addConstraints:constraints];
    return [constraints firstObject];
}

#pragma mark -
#pragma mark - Align with other views

- (void)addConstraintsForVerticalOffset:(CGFloat)verticalOffset toView:(UIView *)otherView
{
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.superview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[view]-verticalOffset-[otherView]" options:0 metrics:@{ @"verticalOffset": [NSNumber numberWithFloat:verticalOffset] } views:@{ @"view": self,  @"otherView": otherView }]];
}

- (void)addConstraintsForHorizontalOffset:(CGFloat)horizontalOffset toView:(UIView *)otherView
{
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.superview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[view]-horizontalOffset-[otherView]" options:0 metrics:@{ @"horizontalOffset": [NSNumber numberWithFloat:horizontalOffset] } views:@{ @"view": self,  @"otherView": otherView }]];
}

- (NSLayoutConstraint *)addConstraintsToAlignHorizontalCenterToView:(UIView *)otherView
{
    return [self addConstraintsToAlignHorizontalCenterToView:otherView offset:0];
}

- (NSLayoutConstraint *)addConstraintsToAlignHorizontalCenterToView:(UIView *)otherView offset:(CGFloat)offset
{
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *centerXConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:otherView attribute:NSLayoutAttributeCenterX multiplier:1.f constant:offset];
    [self.superview addConstraint:centerXConstraint];
    return centerXConstraint;
}

- (NSLayoutConstraint *)addConstraintsToAlignVerticalCenterToView:(UIView *)otherView offset:(CGFloat)offset
{
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *centerYConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:otherView attribute:NSLayoutAttributeCenterY multiplier:1.f constant:offset];
    [self.superview addConstraint:centerYConstraint];
    return centerYConstraint;
}

- (void)addConstraintsForEqualHeightToView:(UIView *)otherView
{
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:otherView attribute:NSLayoutAttributeHeight multiplier:1 constant:0];
    [self.superview addConstraint:constraint];
}

- (void)addConstraintsForEqualWidthToView:(UIView *)otherView
{
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:otherView attribute:NSLayoutAttributeWidth multiplier:1 constant:0];
    [self.superview addConstraint:constraint];
}

#pragma mark -
#pragma mark - Validating constraints

- (void)debugConstraints
{
    [self validateConstraints];
    
    [self.constraints enumerateObjectsUsingBlock:^(NSLayoutConstraint *constraint, NSUInteger idx, BOOL *stop) {
        DDLogDebug(@"Constraint %@ ", constraint);
    }];
}

- (BOOL)validateConstraints
{
    return [self validateHorizontalConstraints] && [self validateVerticalConstraints];
}

- (NSDictionary *)horizontalConstraints
{
    __block NSMutableDictionary *horizontalConstraints = [NSMutableDictionary dictionary];
    [horizontalConstraints setObject:[NSMutableArray new] forKey:left];
    [horizontalConstraints setObject:[NSMutableArray new] forKey:right];
    [self.superview.constraints enumerateObjectsUsingBlock:^(NSLayoutConstraint *constraint, NSUInteger idx, BOOL *stop) {
        if ([constraint.firstItem isEqual:self] || [constraint.secondItem isEqual:self])
        {
            if ([self horizontalLeftAttribute:constraint.firstAttribute] || [self horizontalLeftAttribute:constraint.secondAttribute])
            {
                [[horizontalConstraints objectForKey:left] addObject:constraint];
            }
            if ([self horizontalRightAttribute:constraint.firstAttribute] || [self horizontalRightAttribute:constraint.secondAttribute])
            {
                [[horizontalConstraints objectForKey:right] addObject:constraint];
            }
            DDLogDebug(@"Constraint %@", constraint);
        }
    }];
    
    DDLogDebug(@"Horizontal Constraints %@", horizontalConstraints);
    return horizontalConstraints;
}

- (NSDictionary *)verticalConstraints
{
    __block NSMutableDictionary *verticalConstraints = [NSMutableDictionary dictionary];
    [verticalConstraints setObject:[NSMutableArray new] forKey:top];
    [verticalConstraints setObject:[NSMutableArray new] forKey:bottom];
    [self.superview.constraints enumerateObjectsUsingBlock:^(NSLayoutConstraint *constraint, NSUInteger idx, BOOL *stop) {
        if ([constraint.firstItem isEqual:self] || [constraint.secondItem isEqual:self])
        {
            if ([self verticalTopAttribute:constraint.firstAttribute] || [self verticalTopAttribute:constraint.secondAttribute])
            {
                [[verticalConstraints objectForKey:top] addObject:constraint];
            }
            if ([self verticalBottomAttribute:constraint.firstAttribute] || [self verticalBottomAttribute:constraint.secondAttribute])
            {
                [[verticalConstraints objectForKey:bottom] addObject:constraint];
            }
            DDLogDebug(@"Constraint %@", constraint);
        }
    }];
    
    DDLogDebug(@"Vertical Constraints %@", verticalConstraints);
    return verticalConstraints;
}

- (BOOL)validateHorizontalConstraints
{
    NSDictionary *horizontalConstraints = [self horizontalConstraints];
    // If it is a view with instrinsic size - like UILabel, UIButton or UIImageView just a leading/trailing or left/right constraint is necessary for the layout to be valid
    if (self.intrinsicContentSize.width > 0 && self.intrinsicContentSize.height > 0)
    {
        if ([[horizontalConstraints objectForKey:left] count] + [[horizontalConstraints objectForKey:right] count] == 0)
        {
            DDLogError(@"Error: View with intrinsic content size has no left/right horizontal constraints");
            return NO;
        }
        
        if ([[horizontalConstraints objectForKey:left] count] == 1 && [[horizontalConstraints objectForKey:right] count] == 1)
        {
            DDLogDebug(@"View with intrinsic content size has just both left and right horizontal constraints - the content size will be calculated based on the constraints not the content inside the view");
            return YES;
        }
        
        if (([[horizontalConstraints objectForKey:left] count] + [[horizontalConstraints objectForKey:right] count]) == 1)
        {
            DDLogDebug(@"View with intrinsic content size has just one left/right horizontal constraint");
            return YES;
        }
        
        if ([[horizontalConstraints objectForKey:left] count] > 1)
        {
            DDLogWarn(@"View with intrinsic content size has more then one left horizontal constraints - this might cause layout errors");
            return NO;
        }
        
        if ([[horizontalConstraints objectForKey:right] count] > 1)
        {
            DDLogWarn(@"View with intrinsic content size has more then one right horizontal constraints - this might cause layout errors");
            return NO;
        }
    }
    
    return YES;
}

- (BOOL)validateVerticalConstraints
{
    NSDictionary *verticalConstraints = [self verticalConstraints];
    // If it is a view with instrinsic size - like UILabel, UIButton or UIImageView just a leading/trailing or left/right constraint is necessary for the layout to be valid
    if (self.intrinsicContentSize.width > 0 && self.intrinsicContentSize.height > 0)
    {
        if ([[verticalConstraints objectForKey:top] count] + [[verticalConstraints objectForKey:bottom] count] == 0)
        {
            DDLogError(@"Error: View with intrinsic content size has no top/bottom vertical constraints");
            return NO;
        }
        
        if ([[verticalConstraints objectForKey:top] count] == 1 && [[verticalConstraints objectForKey:bottom] count] == 1)
        {
            DDLogDebug(@"View with intrinsic content size has just both top and bottom vertical constraints - the content size will be calculated based on the constraints not the content inside the view");
            return YES;
        }
        
        if (([[verticalConstraints objectForKey:top] count] + [[verticalConstraints objectForKey:bottom] count]) == 1)
        {
            DDLogDebug(@"View with intrinsic content size has just one top/bottom vertical constraint");
            return YES;
        }
        
        if ([[verticalConstraints objectForKey:top] count] > 1)
        {
            DDLogWarn(@"View with intrinsic content size has more then one top vertical constraints - this might cause layout errors");
            return NO;
        }
        
        if ([[verticalConstraints objectForKey:bottom] count] > 1)
        {
            DDLogWarn(@"View with intrinsic content size has more then one bottom vertical constraints - this might cause layout errors");
            return NO;
        }
    }
    
    return YES;
}

- (BOOL)horizontalRightAttribute:(NSLayoutAttribute)attribute
{
    return attribute == NSLayoutAttributeRight || attribute == NSLayoutAttributeRightMargin || attribute == NSLayoutAttributeTrailing || attribute == NSLayoutAttributeTrailingMargin;
}

- (BOOL)horizontalLeftAttribute:(NSLayoutAttribute)attribute
{
    return attribute == NSLayoutAttributeLeading || attribute == NSLayoutAttributeLeadingMargin || attribute == NSLayoutAttributeLeft || attribute == NSLayoutAttributeLeftMargin;
}

- (BOOL)verticalTopAttribute:(NSLayoutAttribute)attribute
{
    return attribute == NSLayoutAttributeTop || attribute == NSLayoutAttributeTopMargin;
}

- (BOOL)verticalBottomAttribute:(NSLayoutAttribute)attribute
{
    return attribute == NSLayoutAttributeBottom || attribute == NSLayoutAttributeBottomMargin;
}

@end
