//
//  Playground.swift
//  VisualConstraints
//
//  Created by Catalina Turlea on 4/13/15.
//  Copyright (c) 2015 Catalina Turlea. All rights reserved.
//

import Foundation
import UIKit

class SwiftViewController: UIViewController {
    
    @IBOutlet weak var coverImage: UIImageView!
    
    override
    func viewDidLoad (){
        var mbd : [String:UIButton]! = [:]
            for index in 0...10 {
                var button = UIButton.buttonWithType(UIButtonType.System) as! UIButton
//                self.view.addSubview(button)
                mbd["button"+String(index)] = button
            }
//        print(mbd)
        
        
        var nameLabel = UILabel();
        var previewButton = UIButton();
        let aboutLabelCaption = UILabel();
        let aboutLabel = UILabel();
        let specsScrollView = UIScrollView();
        let specsView = UIView(frame: CGRectMake(0, 0, 400, 400));
        
        // NAME LABEL
        view.addSubview(nameLabel);
        nameLabel.frame = CGRect(x: 8, y: 150, width: 150, height: 80);
        
        nameLabel.setTranslatesAutoresizingMaskIntoConstraints(false);
        nameLabel.textColor = UIColor.whiteColor();
        nameLabel.font = UIFont(name: "Optima-Regular", size: 50);
        nameLabel.numberOfLines = 2;
        nameLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping;
        
        let idealY = coverImage.frame.size.height - 125;
        println("The coverImage height is \(coverImage.frame.size.height)");
        println("The ideal Y should be \(idealY)");
        
        var nameLabelConstY = NSLayoutConstraint(item: nameLabel,
            attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal,
            toItem: view, attribute: NSLayoutAttribute.Top, multiplier: 1,
            constant: idealY);
        var nameLabelConstX = NSLayoutConstraint(item: nameLabel,
            attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal,
            toItem: view, attribute: NSLayoutAttribute.Leading, multiplier: 1,
            constant: 16);
        var nameLabelConstWidth = NSLayoutConstraint(item: nameLabel,
            attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal,
            toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1,
            constant: 500);
        
        view.addConstraint(nameLabelConstY);
        view.addConstraint(nameLabelConstX);
        view.addConstraint(nameLabelConstWidth);
        // -- END NAME LABEL
        
        // PREVIEW BUTTON
        previewButton.titleLabel?.text = "WATCH PREVIEW";
        previewButton.titleLabel?.textColor = UIColor.whiteColor();
        view.addSubview(previewButton);
        previewButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        var previewButtonConstY = NSLayoutConstraint(item: previewButton,
            attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal,
            toItem: view, attribute: NSLayoutAttribute.Top, multiplier: 1,
            constant: 150);
        var previewButtonConstX = NSLayoutConstraint(item: previewButton,
            attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal,
            toItem: view, attribute: NSLayoutAttribute.Leading, multiplier: 1,
            constant: 200);
        var previewButtonConstWidth = NSLayoutConstraint(item: previewButton,
            attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal,
            toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1,
            constant: 150);
        
        view.addConstraint(previewButtonConstY);
        view.addConstraint(previewButtonConstX);
        view.addConstraint(previewButtonConstWidth);
        // -- END PREVIEW BUTTON
        
        // ABOUT LABEL CAPTION
        view.addSubview(aboutLabelCaption);
        
        aboutLabelCaption.text = "About this recipe...";
        aboutLabelCaption.setTranslatesAutoresizingMaskIntoConstraints(false);
        aboutLabelCaption.textColor = UIColor.blackColor();
        aboutLabelCaption.font = UIFont(name: "Optima-Bold", size: 25);
        
        var aboutLabelCaptionConstY = NSLayoutConstraint(item: aboutLabelCaption,
            attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal,
            toItem: coverImage, attribute: NSLayoutAttribute.Bottom, multiplier: 1,
            constant: 10);
        var aboutLabelCaptionConstX = NSLayoutConstraint(item: aboutLabelCaption,
            attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal,
            toItem: view, attribute: NSLayoutAttribute.Leading, multiplier: 1,
            constant: 10);
        var aboutLabelCaptionConstWidth = NSLayoutConstraint(item: aboutLabelCaption,
            attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal,
            toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1,
            constant: 500);
        
        view.addConstraint(aboutLabelCaptionConstY);
        view.addConstraint(aboutLabelCaptionConstX);
        view.addConstraint(aboutLabelCaptionConstWidth);
        // -- END ABOUT LABEL CAPTION
        
        // ABOUT LABEL
        view.addSubview(aboutLabel);
//        aboutLabel.frame = CGRect(x: 8, y: 150, width: 150, height: 80);
        
        aboutLabel.setTranslatesAutoresizingMaskIntoConstraints(false);
        aboutLabel.textColor = UIColor.blackColor();
        aboutLabel.font = UIFont(name: "Optima-Regular", size: 18);
        aboutLabel.numberOfLines = 20;
        aboutLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping;
        
        var aboutLabelConstY = NSLayoutConstraint(item: aboutLabel,
            attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal,
            toItem: aboutLabelCaption, attribute: NSLayoutAttribute.Bottom, multiplier: 1,
            constant: 10);
        var aboutLabelConstX = NSLayoutConstraint(item: aboutLabel,
            attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal,
            toItem: view, attribute: NSLayoutAttribute.Leading, multiplier: 1,
            constant: 10);
        var aboutLabelConstWidth = NSLayoutConstraint.constraintsWithVisualFormat("H:[aboutLabel(600)]", options: nil, metrics: nil, views: ["aboutLabel":aboutLabel]);
        
        view.addConstraint(aboutLabelConstY);
        view.addConstraint(aboutLabelConstX);
        view.addConstraints(aboutLabelConstWidth);
        // -- END ABOUT LABEL
        
        // SPEC DETAILS SECTION
        view.addSubview(specsScrollView);
        
        var specsScrollViewConstY = NSLayoutConstraint(item: specsScrollView,
            attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal,
            toItem: coverImage, attribute: NSLayoutAttribute.Bottom, multiplier: 1,
            constant: 10);
        var specsScrollViewConstX = NSLayoutConstraint(item: specsScrollView,
            attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal,
            toItem: aboutLabel, attribute: NSLayoutAttribute.Trailing, multiplier: 1,
            constant: 10);
        var specsScrollViewConstWidth = NSLayoutConstraint.constraintsWithVisualFormat("H:[scrollview(400)]", options: nil, metrics: nil, views: ["scrollview":specsScrollView]);
        var specsScrollViewConstHeight = NSLayoutConstraint.constraintsWithVisualFormat("V:[scrollview(400)]", options: nil, metrics: nil, views: ["scrollview":specsScrollView]);
        
        view.addConstraint(specsScrollViewConstY);
        view.addConstraint(specsScrollViewConstX);
        view.addConstraints(specsScrollViewConstWidth);
        view.addConstraints(specsScrollViewConstHeight);
        
//        let topLevelArray: NSArray = NSBundle.mainBundle().loadNibNamed("PreviewDetails", owner: self, options: nil);
//        let viewFromXib = topLevelArray.objectAtIndex(0) as UIView;
        
        specsScrollView.backgroundColor = UIColor.redColor();
        specsView.backgroundColor = UIColor.orangeColor();
        specsScrollView.addSubview(specsView);
        //specsScrollView.addSubview(viewFromXib);
        
        specsScrollView.setTranslatesAutoresizingMaskIntoConstraints(false);
        //specsView.setTranslatesAutoresizingMaskIntoConstraints(false);
//        specsScrollView.contentSize = CGSizeMake(400, 400);
        
        var specsViewConstTop = NSLayoutConstraint(item: specsView,
            attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal,
            toItem: specsScrollView, attribute: NSLayoutAttribute.Top, multiplier: 1,
            constant: 0);
        var specsViewConstLeading = NSLayoutConstraint(item: specsView,
            attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal,
            toItem: specsScrollView, attribute: NSLayoutAttribute.Leading, multiplier: 1,
            constant: 0);
        var specsViewConstTrailing = NSLayoutConstraint(item: specsView,
            attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal,
            toItem: specsScrollView, attribute: NSLayoutAttribute.Trailing, multiplier: 1,
            constant: 0);
        var specsViewConstBottom = NSLayoutConstraint(item: specsView,
            attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal,
            toItem: specsScrollView, attribute: NSLayoutAttribute.Bottom, multiplier: 1,
            constant: 0);
        var specsViewConstHeight = NSLayoutConstraint.constraintsWithVisualFormat("V:[specsView(400)]", options: nil, metrics: nil, views: ["specsView":specsView]);
        var specsViewConstWidth = NSLayoutConstraint.constraintsWithVisualFormat("H:[specsView(400)]", options: nil, metrics: nil, views: ["specsView":specsView]);
        
        specsScrollView.addConstraint(specsViewConstTop);
        specsScrollView.addConstraint(specsViewConstLeading);
        specsScrollView.addConstraint(specsViewConstTrailing);
        specsScrollView.addConstraint(specsViewConstBottom);
        specsScrollView.addConstraints(specsViewConstHeight);
        specsScrollView.addConstraints(specsViewConstWidth);
        
        let aLabel = UILabel();
        aLabel.text = "Hola mundo";
        specsView.addSubview(aLabel);
        
        view.layoutIfNeeded()
    }
}
