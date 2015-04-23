//
//  MyTableViewCell.m
//  VisualConstraints
//
//  Created by Catalina Turlea on 4/23/15.
//  Copyright (c) 2015 Catalina Turlea. All rights reserved.
//

#import "MyTableViewCell.h"

@interface MyTableViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *highlightImageView;

@end

@implementation MyTableViewCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [self.highlightImageView setHighlighted:selected];
}

-(void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    [self.highlightImageView setHighlighted:highlighted];
}

@end
