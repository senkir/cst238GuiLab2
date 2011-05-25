//
//  OITAnalogClockController.m
//  lab2DasClock
//
//  Created by Travis Churchill on 5/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "OITAnalogClockController.h"


@implementation OITAnalogClockController
@synthesize clockBody = _clockBody;
@synthesize secondsHand = _secondsHand;
@synthesize minutesHand = _minutesHand;
@synthesize hoursHand = _hoursHand;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)loadView {
    [super loadView];
    NSLog(@"OITAnalogClockController: setting up the clock display.");
    NSImage* clockImage = [NSImage imageNamed: @"clock_bg.png"];
    [_clockBody setImage:clockImage];
}

- (void)secondsShouldUpdate:(NSDate *)timeStamp {
    NSLog(@"OITAnalogClockController:  received notice that time should update");
    [self updateTime];
}

- (void)minutesShouldUpdate:(NSDate *)timeStamp {
    NSLog(@"OITAnalogClockController:  received notice that time should update");
    [self updateTime];
}

- (void)updateTime {
    NSLog(@"OITAnalogClockController: updateTime");
}
@end
