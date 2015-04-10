//
//  VCViewController.m
//  VisualConstraints
//
//  Created by Catalina Turlea on 03/23/2015.
//  Copyright (c) 2014 Catalina Turlea. All rights reserved.
//

#import "VCViewController.h"

@interface VCViewController ()
@property (weak, nonatomic) IBOutlet UITextField *inputField;

@end

@implementation VCViewController

- (void)viewDidLoad {
	[super viewDidLoad];
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = [UIColor redColor];
    [line setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.inputField addSubview:line];
    
    // Vertical constraints
    [self.inputField addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[line-(-1)-|" options:0 metrics:nil views:@{ @"line": line}]];
    
    // Horizontal constraints
    [self.inputField addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(-8)-[line]-8-|" options:0 metrics:nil views:@{ @"line": line}]];
    

	UIButton *b1 = [[UIButton alloc] init];
	UIButton *b2 = [[UIButton alloc] init];
	UIButton *b3 = [[UIButton alloc] init];

	for (UIButton *b in @[b1, b2, b3]) {
		[b setTranslatesAutoresizingMaskIntoConstraints:NO];
		[self.view addSubview:b];
		[b.layer setBorderWidth:1];
		[b setBackgroundColor:[UIColor redColor]];
		[b setTitle:@"test" forState:UIControlStateNormal];
	}
	[self.view addConstraint:[NSLayoutConstraint constraintWithItem:b1 attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:0]];

	[self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[b1]-0-[b2(==b1)]-0-[b3(==b1)]-0-|" options:NSLayoutFormatAlignAllBottom metrics:nil views:@{ @"b1":b1, @"b2":b2, @"b3":b3 }]];
}

@end
