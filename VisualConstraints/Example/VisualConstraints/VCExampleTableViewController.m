//
//  VCExampleTableViewController.m
//  VisualConstraints
//
//  Created by Catalina Turlea on 4/28/15.
//  Copyright (c) 2015 Catalina Turlea. All rights reserved.
//

#import "VCExampleTableViewController.h"

@interface VCExampleTableViewController ()

@property (nonatomic, strong) NSArray *examplesArray;

@end

@implementation VCExampleTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setExamplesArray:@[@"ScrollView", @"Common Controls"]];
}

#pragma mark -
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.examplesArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    [cell.textLabel setText:[self.examplesArray objectAtIndex:indexPath.row]];
    return cell;
}

@end
