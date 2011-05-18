//
//  lab2DasClockAppDelegate.m
//  lab2DasClock
//
//  Created by Travis Churchill on 5/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "lab2DasClockAppDelegate.h"
#import "OITRootViewController.h"
#import "OITComboBoxDataSource.h"

@implementation lab2DasClockAppDelegate

@synthesize view = _view;
@synthesize dropdownBox = _dropdownBox;
@synthesize submitButton = _submitButton;

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    NSLog(@"application did finish launching");
    [self.dropdownBox setUsesDataSource:true];
    _comboBoxDataSource = [[OITComboBoxDataSource alloc] init];
    [self.dropdownBox setDataSource:_comboBoxDataSource];
    
}

- (void)dealloc {
    [_comboBoxDataSource release];
    [super dealloc];
}
- (IBAction) submitButtonWasSelected:(id)sender {
    NSLog(@"submit button was selected");
    
}

@end
