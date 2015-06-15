//
//  VCConstraintsTest.m
//  VisualConstraints
//
//  Created by Catalina Turlea on 5/2/15.
//  Copyright (c) 2015 Catalina Turlea. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import <VisualConstraints/VisualConstraints.h>

@interface VCConstraintsTest : XCTestCase

@property (nonatomic, strong) UIView *containerView;

@end

@implementation VCConstraintsTest

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    [self setContainerView:[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 640)]];
    
    [DDLog addLogger:[DDASLLogger sharedInstance] withLevel:DDLogLevelWarning];
    [DDLog addLogger:[DDTTYLogger sharedInstance] withLevel:DDLogLevelWarning];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSimpleLabelOneConstraint
{
    UILabel *label = [[UILabel alloc] init];
    [self.containerView addSubview:label];
    [label setText:@"test label"];
    
    [label addConstraintsToAlignLeftWithOffset:20];
    
    XCTAssert([label validateHorizontalConstraints], @"Validate Constraints");
    XCTAssertFalse([label validateVerticalConstraints], @"Validate Constraints");
    
    __block NSInteger allHorizontalConstraints = 0;
    
    [[[label horizontalConstraints] allValues] enumerateObjectsUsingBlock:^(NSArray *constaints, NSUInteger idx, BOOL *stop) {
        allHorizontalConstraints += [constaints count];
    }];
    
    XCTAssertEqual(allHorizontalConstraints, 1, @"Horizontal constaints number");
}

- (void)testSimpleLabelMoreConstraints
{
    UILabel *label = [[UILabel alloc] init];
    [self.containerView addSubview:label];
    [label setText:@"test label"];
    
    [label addConstraintsToFillHorizontalWithLeftPadding:20 rightPadding:20];
    
    XCTAssert([label validateHorizontalConstraints], @"Validate Constraints");
    XCTAssertFalse([label validateVerticalConstraints], @"Validate Constraints");
    
    __block NSInteger allHorizontalConstraints = 0;
    
    [[[label horizontalConstraints] allValues] enumerateObjectsUsingBlock:^(NSArray *constaints, NSUInteger idx, BOOL *stop) {
        allHorizontalConstraints += [constaints count];
    }];
    
    XCTAssertEqual(allHorizontalConstraints, 2, @"Horizontal constaints number");
}

- (void)testSimpleLabelConflictingConstraints
{
    UILabel *label = [[UILabel alloc] init];
    [self.containerView addSubview:label];
    [label setText:@"test label"];
    
    [label addConstraintsToFillHorizontalWithLeftPadding:20 rightPadding:20];
    [label addConstraintsToFillHorizontalWithLeftPadding:30 rightPadding:30];
    
    XCTAssertFalse([label validateHorizontalConstraints], @"Validate Constraints");
    XCTAssertFalse([label validateVerticalConstraints], @"Validate Constraints");
    
    __block NSInteger allHorizontalConstraints = 0;
    
    [[[label horizontalConstraints] allValues] enumerateObjectsUsingBlock:^(NSArray *constaints, NSUInteger idx, BOOL *stop) {
        allHorizontalConstraints += [constaints count];
    }];
    
    XCTAssertEqual(allHorizontalConstraints, 4, @"Horizontal constaints number");
}

@end
