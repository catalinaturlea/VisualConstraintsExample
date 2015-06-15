# visualConstraints
The Visual Constraints Pod provides methods to easily add and debug constraints programmatically in iOS, using the visual constraints format. 

It includes methods for the most commonly used layouting of UI elements: align top/bottom/left/right in the superview, center or fill the superview and aligning in relation to other UI elements. 

Furthermore, the Pod includes methods to ease the use of scrollviews and autolayout.

## Requirements

- iOS 7.0+
- Xcode 6.1

## Get Started

[Download the VisualConstraints Example Project](https://github.com/catalinaturlea/visualConstraints/archive/master.zip). You can run the example app that includes various usage examples, both in Objective-C and Swift.


## Usage

The methods to add constraints to UI elements are pretty straight forward and easy to use:

```swift
let contentView = UIView()
self.view.addSubview(contentView)
        
// Add the constraints
contentView.addConstraintsForWidth(300)
contentView.addConstraintsForHeight(200)
contentView.addConstraintsToCenter()
```

## Debugging programmatically added constraints
When using the storyboard, you are shown errors and warnings when your constraints are not consistent, missing or conflicting. 
The Pod provides methods to similarly debug programmatically added constraints. It uses Cocoa Lumberjack for logging messages.


