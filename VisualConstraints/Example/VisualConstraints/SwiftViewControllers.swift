//
//  SwiftViewControllers.swift
//  VisualConstraints
//
//  Created by Catalina Turlea on 5/2/15.
//  Copyright (c) 2015 Catalina Turlea. All rights reserved.
//

import UIKit

class SwiftExampleViewController: UIViewController {
    
    override func viewDidLoad() {
        
        let contentView = UIView()
        self.view.addSubview(contentView)
        
        // Add the constraints
        contentView.addConstraintsForWidth(300)
        contentView.addConstraintsForHeight(200)
        contentView.addConstraintsToCenter()
        contentView.backgroundColor = UIColor.redColor()
        contentView.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        // Adding a label to the contentView
        let label = UILabel()
        contentView.addSubview(label)
        label.backgroundColor = UIColor.whiteColor()
        
        label.addConstraintsToAlignLeftWithOffset(10)
        label.addConstraintsToAlignTopWithOffset(20)
        label.text = "Left aligned label"
        
        // Adding a label to the contentView
        let label2 = UILabel()
        contentView.addSubview(label2)
        label2.backgroundColor = UIColor.whiteColor()
        
        label2.addConstraintsToFillHorizontalWithLeftPadding(10, rightPadding:10)
        label2.text = "Full width label"
        label.addConstraintsForVerticalOffset(20, toView:label2)
        
        let image = UIImageView()
        image.highlighted = true;
    }
}