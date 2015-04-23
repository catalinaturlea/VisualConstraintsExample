//
//  VCViewController.m
//  VisualConstraints
//
//  Created by Catalina Turlea on 03/23/2015.
//  Copyright (c) 2014 Catalina Turlea. All rights reserved.
//

#import "VCViewController.h"
#import <VisualConstraints/VisualConstraints.h>

@interface VCViewController ()

@end

@implementation VCViewController

- (void)addViewsToScrollViewHorizontally {
    // Example - ScrollView with vertical views that fill the scrollView horizontally
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    [self.view addSubview:scrollView];
    [scrollView addConstraintsToFillHorizontal];
    [scrollView addConstraintsToFillVertical];
    [scrollView addConstraintsForEqualWidthToView:self.view];
    [scrollView setBackgroundColor:[UIColor redColor]];
    
    NSMutableArray *views = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 10; i++) {
        UIView *view = [[UIView alloc] init];
        [view setBackgroundColor:[UIColor colorWithRed:255/255.0f green:40*i/255.0f blue:20*i/255.0f alpha:1]];
        [scrollView addSubview:view];
        [views addObject:view];
        [view addConstraintsForWidth:(i + 1) * 50];
    }
    
    [scrollView addConstraintsToAlignHorizontalAllViews:views];
}

- (void)addViewsToScrollViewVertically {
    // Example - ScrollView with vertical views that fill the scrollView horizontally
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    [self.view addSubview:scrollView];
    [scrollView addConstraintsToFillHorizontal];
    [scrollView addConstraintsToFillVertical];
    [scrollView addConstraintsForEqualWidthToView:self.view];
    [scrollView setBackgroundColor:[UIColor redColor]];
    
    NSMutableArray *views = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < 10; i++) {
        UIView *view = [[UIView alloc] init];
        [view setBackgroundColor:[UIColor colorWithRed:255/255.0f green:255/255.0f blue:30*i/255.0f alpha:1]];
        [scrollView addSubview:view];
        [views addObject:view];
        [view addConstraintsForHeight:(i + 1) * 50];
    }
    
    [scrollView addConstraintsToAlignVerticalAllViews:views];
    
    [self.view layoutIfNeeded];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addViewsToScrollViewVertically];
    
    
    [self addViewsToScrollViewHorizontally];
    
    [self.view layoutIfNeeded];
}

@end
