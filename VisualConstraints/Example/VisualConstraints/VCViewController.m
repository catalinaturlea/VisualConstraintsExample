//
//  VCViewController.m
//  VisualConstraints
//
//  Created by Catalina Turlea on 03/23/2015.
//  Copyright (c) 2014 Catalina Turlea. All rights reserved.
//

#import "VCViewController.h"

#import "VisualConstraints-Bridging-Header.h"

@interface VCViewController () <UITextViewDelegate, UITableViewDataSource, UITableViewDelegate, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textViewHeightConstraint;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation VCViewController

- (void)viewDidLoad {
	[super viewDidLoad];
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor = [UIColor redColor];
    [line setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.inputField addSubview:line];
    
    // Vertical constraints
//    [self.inputField addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[line]-(-1)-|" options:0 metrics:nil views:@{ @"line": line}]];
    
    // Horizontal constraints
//    [self.inputField addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(-8)-[line]-8-|" options:0 metrics:nil views:@{ @"line": line}]];
    

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

	[self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[b1]-0-[b2(b1)]-0-[b3(b1)]-0-|" options:NSLayoutFormatAlignAllBottom metrics:nil views:@{ @"b1":b1, @"b2":b2, @"b3":b3 }]];
    
    UICollectionView * collectionView;
    
    
//    UIViewController *view = [[SwiftViewController alloc] init];
    
//    [view.view setBackgroundColor:[UIColor grayColor]];
//
//    [self addChildViewController:view];
//    [self.view addSubview:view.view];
//    [view didMoveToParentViewController:self];
    
//    [self.view addConstraints:[NSLayoutConstraint cons`traintsWithVisualFormat:@"H:|-0-[view]-0-|" options:0 metrics:nil views:@{ @"view": view.view}]];
//        [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[view]-0-|" options:0 metrics:nil views:@{ @"view": view.view}]];
    [self.textView addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionInitial context:nil];
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
//    [self.textViewHeightConstraint setConstant:self.textView.contentSize.height];

    CGRect buttonFrame = self.button.frame;
    buttonFrame.origin.y += self.scrollView.contentOffset.y;
    buttonFrame.origin.x += self.scrollView.contentOffset.x;
    [self.button setFrame:buttonFrame];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [tableView dequeueReusableCellWithIdentifier:@"Cell"];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (void)dealloc {
    [self.textView removeObserver:self forKeyPath:@"contentSize"];
}

@end
