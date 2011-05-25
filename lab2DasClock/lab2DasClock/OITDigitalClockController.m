//
//  OITDigitalClockController.m
//  lab2DasClock
//
//  Created by Travis Churchill on 5/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "OITDigitalClockController.h"

@implementation OITDigitalClockController

@synthesize hoursDisplay1 = _hoursDisplay1;
@synthesize hoursDisplay2 = _hoursDisplay2;
@synthesize minutesDisplay1 = _minutesDisplay1;
@synthesize minutesDisplay2 = _minutesDisplay2;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //setup stuff here
        _controllersArray = nil;
    }
    return self;
}

- (void)dealloc
{
    [_controllersArray release];
    _controllersArray = nil;
    [super dealloc];
}

- (void)loadView {
    [super loadView];
    NSMutableArray* viewControllers = [[NSMutableArray alloc] init];
    OITSevenSegmentDigitController *viewController = nil;
    NSArray* displays = [NSArray arrayWithObjects:_hoursDisplay1, _hoursDisplay2, _minutesDisplay1, _minutesDisplay2, nil];
    NSLog(@"Setting up the clock display");
    for (int i = 0; i < [displays count]; i++) {
        viewController = [[OITSevenSegmentDigitController alloc] initWithParentView:[displays objectAtIndex:i]];
        [viewControllers addObject:viewController];
        [viewController release];
    }
    _controllersArray = [viewControllers copy];
    [viewControllers release];
    for (int i = [_controllersArray count] - 1 ; i > 0; i--) {
        if (i > 0) {
            [[_controllersArray objectAtIndex:i] setNextDigit:[_controllersArray objectAtIndex:i-1]];
        }
    }
    [[_controllersArray objectAtIndex:0] setMaxValue:1];
    [[_controllersArray objectAtIndex:3] setMaxValue:5];
    [self initializeTime];
    NSLog(@"OITDigitalClockController: clock controller is now set up");
}

/**
 Set the current time
 */
- (void)initializeTime {
    NSLog(@"OITDigitalClockController: initialize time");
    NSCalendar* currentCalendar = [NSCalendar currentCalendar];
    NSDateComponents* timeComponents = [currentCalendar components:NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit fromDate:[NSDate date]];
    NSInteger hourComponent = [timeComponents hour];
    [[_controllersArray objectAtIndex:1] setValue:hourComponent withOverflow:YES];
    NSUInteger minuteComponent = [timeComponents minute];
    [[_controllersArray objectAtIndex:3] setValue:minuteComponent withOverflow:YES];
    NSLog(@"OITDigitalClockController: time set to %d %d : %d %d", (int)[[_controllersArray objectAtIndex:0] value],
          (int)[[_controllersArray objectAtIndex:1] value], (int)[[_controllersArray objectAtIndex:2] value], (int)[[_controllersArray objectAtIndex:3] value]);
}

- (void)digitDidRollOver:(OITSevenSegmentDigitController *)sender {
    //check if the rolled over digit was the second hours digit
    if ([_controllersArray objectAtIndex:1] == sender) {
        OITSevenSegmentDigitController* digitController = [_controllersArray objectAtIndex:1];
        if ([digitController maxValue] == 10) {
            [digitController setMaxValue:2];
        } else {
            [digitController setMaxValue:10];
        }
    }  
}

- (void)updateTime {
    NSLog(@"OITDigitalClockController: updating display");
    //go through the digits and do digital-specific stuff
    [(OITSevenSegmentDigitController*)[_controllersArray objectAtIndex:[_controllersArray count]] incrementDigit];
    NSLog(@"OITDigitalClockController: time set to %d %d : %d %d", (int)[[_controllersArray objectAtIndex:0] value],
          (int)[[_controllersArray objectAtIndex:1] value], (int)[[_controllersArray objectAtIndex:2] value], (int)[[_controllersArray objectAtIndex:3] value]);
}

- (void)minutesShouldUpdate:(NSDate *)timeStamp {
    NSLog(@"OITDigitalClockController:  received notice that time should update");
    [self updateTime];
}
@end
