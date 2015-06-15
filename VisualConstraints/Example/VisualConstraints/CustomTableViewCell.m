//
//  CustomTableViewCell.m
//  VisualConstraints
//
//  Created by Catalina Turlea on 3/19/15.
//  Copyright (c) 2015 Catalina Turlea. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

- (void)awakeFromNib {
	// Initialization code
	[self setupSubviews];
}

- (void)setupSubviews {
	UIImageView *imageView = [[UIImageView alloc] init];
	[self.contentView addSubview:imageView];
	[imageView setTranslatesAutoresizingMaskIntoConstraints:NO];

	UILabel *label = [[UILabel alloc] init];
	[label setFont:[label.font fontWithSize:12]];
	[self.contentView addSubview:label];
	[label setTranslatesAutoresizingMaskIntoConstraints:NO];
	[label setNumberOfLines:0];
	[label setTextAlignment:NSTextAlignmentCenter];
	[self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[image]-[label]-0-|" options:0 metrics:nil views:@{ @"label":label, @"image":imageView }]];
	[imageView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[label]-0-|" options:0 metrics:nil views:@{ @"label":label }]];

	[self.contentView layoutIfNeeded];
}

@end
