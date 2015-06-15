//
//  VCCommonControlsViewController.m
//  VisualConstraints
//
//  Created by Catalina Turlea on 4/28/15.
//  Copyright (c) 2015 Catalina Turlea. All rights reserved.
//

#import "VCCommonControlsViewController.h"
#import <VisualConstraints/VisualConstraints.h>

@interface VCCommonControlsViewController ()

@end

@implementation VCCommonControlsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addTitleLabels];
}

- (void)addTitleLabels
{
    UILabel *label = [[UILabel alloc] init];
    [self.view addSubview:label];
    
    [label addConstraintsToFillHorizontalWithLeftPadding:20 rightPadding:20];
    [label addConstraintsToCenterVerticalWithOffset:0];
    [label setText:@"Title Label"];
    
    UILabel *secondLabel = [[UILabel alloc] init];
    [self.view addSubview:secondLabel];
    
    [secondLabel addConstraintsToFillHorizontalWithLeftPadding:20 rightPadding:20];
    [label addConstraintsForVerticalOffset:20 toView:secondLabel];
    [secondLabel setText:@"Second Label"];
    
    UIButton * button = [[UIButton alloc] init];
    [self.view addSubview:button];
    
    [button setBackgroundColor:[UIColor blueColor]];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitle:@"My Button" forState:UIControlStateNormal];
    [button addConstraintsToAlignBottomWithOffset:20 height:40];
    [button addConstraintsToCenterHorizontalWithWidth:200];
    
    [label debugConstraints];
}

@end
