//
//  OITDigitalClockController.m
//  lab2DasClock
//
//  Created by Travis Churchill on 5/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "OITDigitalClockController.h"
#import "OITSevenSegmentDigitController.h"

@implementation OITDigitalClockController

@synthesize hoursDisplay1 = _hoursDisplay1;
@synthesize hoursDisplay2 = _hoursDisplay2;
@synthesize minutesDisplay1 = _minutesDisplay1;
@synthesize minutesDisplay2 = _minutesDisplay2;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _displayArray = [[NSArray alloc] initWithObjects:_hoursDisplay1, _hoursDisplay2,
        _minutesDisplay1, _minutesDisplay2, nil];
    }
    OITSevenSegmentDigitController *hourController = [[OITSevenSegmentDigitController alloc] initWithNibName:@"OITSevenSegmentDigitController" bundle:nil];                                                  
    [self setHoursDisplay1:[hourController view]];
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)updateTime {
    NSLog(@"OITDigitalClockController: updating display");
    //go through the digits and do digital-specific stuff
}

- (void)secondsShouldUpdate:(NSDate *)timeStamp {
    NSLog(@"OITDigitalClockController:  received notice that time should update");
    [self updateTime];
}
@end
