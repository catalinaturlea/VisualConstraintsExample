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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = [UIColor redColor];
    [line setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.inputField addSubview:line];
    
    // Vertical constraints
    [self.inputField addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[line-(-1)-|" options:0 metrics:nil views:@{ @"line": line}]];
    
    // Horizontal constraints
    [self.inputField addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(-8)-[line]-8-|" options:0 metrics:nil views:@{ @"line": line}]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
