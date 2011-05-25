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
#import "OITDigitalClockController.h"
#import "OITAnalogClockController.h"

#define kDigitalClock @"Digital"
#define kAnalogClock @"Analog"

@implementation lab2DasClockAppDelegate

@synthesize view = _view;
@synthesize dropdownBox = _dropdownBox;
@synthesize submitButton = _submitButton;

@synthesize window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    NSLog(@"application did finish launching");
    [self.dropdownBox setUsesDataSource:true];
    _timeModel = [[OITTimeModel alloc] init];
    _comboBoxDataSource = [[OITComboBoxDataSource alloc] init];
    [self.dropdownBox setDataSource:_comboBoxDataSource];
}

- (void)dealloc {
    [_comboBoxDataSource release];
    [super dealloc];
}
- (IBAction) submitButtonWasSelected:(id)sender {
    NSLog(@"submit button was selected");
    NSInteger index = [_dropdownBox indexOfSelectedItem];
    NSString* result = [_comboBoxDataSource comboBox:_dropdownBox objectValueForItemAtIndex:index];
    NSLog(@"Selected View: %@",result);
    if ([result isEqualToString:kDigitalClock]) {
        [self showDigitalClock];
    } else if ([result isEqualToString:kAnalogClock]){
        [self showAnalogClock];
    }
}
- (void)showDigitalClock {
    if ([_viewController isKindOfClass:[OITDigitalClockController class]]) return;
    [_viewController release];
    //remove subviews because we are going to replace them.  
    NSArray *subviews = [self.view subviews];
    for (NSView *view in subviews) {
        [view removeFromSuperview];
    }
    _viewController = [[OITDigitalClockController alloc] initWithNibName:@"OITDigitalClockController" bundle:nil];
    [self.view addSubview:_viewController.view];
    [_timeModel setDelegate:_viewController];
    NSLog(@"ok that's done");
}

- (void)showAnalogClock {
    if ([_viewController isKindOfClass:[OITAnalogClockController class]]) return;
    [_viewController release];
    //remove subviews because we are going to replace them.  
    NSArray *subviews = [self.view subviews];
    for (NSView *view in subviews) {
        [view removeFromSuperview];
    }
    _viewController = [[OITAnalogClockController alloc] initWithNibName:@"OITAnalogClockController" bundle:nil];
    [self.view addSubview:_viewController.view];
    [_timeModel setDelegate:_viewController];
    NSLog(@"ok that's done");
}
@end
