//
//  ResizableCollectionViewCell.h
//  VisualConstraints
//
//  Created by Catalina Turlea on 3/23/15.
//  Copyright (c) 2015 Catalina Turlea. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResizableCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@property (weak, nonatomic) IBOutlet UIView *contentView;

@end
