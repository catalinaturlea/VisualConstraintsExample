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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addTitleLabels];
}

- (void) addTitleLabels {
    
    UILabel *label = [[UILabel alloc] init];
    [self.view addSubview:label];
    
    [label addConstraintsToFillHorizontalWithLeftPadding:20 rightPadding:20];
    [label addConstraintsToCenterVerticalWithOffset:20];
    
    [label setText:@"Title Label"];
}


// embed views and center

@end
