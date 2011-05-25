//
//  OITAnalogClockController.m
//  lab2DasClock
//
//  Created by Travis Churchill on 5/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "OITAnalogClockController.h"

#define kClockBackgroundFile    @"clock_bg.png"
#define kClockHourHandFile      @"clock_hour.png"
#define kClockMinuteHandFile    @"clock_minute.png"
#define kClockSecondHandFile    @"clock_seconds.png"

@implementation OITAnalogClockController
@synthesize clockBody = _clockBody;
//@synthesize secondsHand = _secondsHand;
//@synthesize minutesHand = _minutesHand;
//@synthesize hoursHand = _hoursHand;

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
    [_hoursHand release];
    [_minutesHand release];
    [_secondsHand release];
    [super dealloc];
}

- (void)loadView {
    [super loadView];
    NSLog(@"OITAnalogClockController: setting up the clock display.");
    NSImage* clockImage = [NSImage imageNamed:kClockBackgroundFile];
    [_clockBody setImage:clockImage];
    
    //hours
    NSImage* hoursImage = [NSImage imageNamed:kClockHourHandFile];
    _hoursHand = [[NSImageView alloc] initWithFrame:[_clockBody frame]];
    [_hoursHand setImage:hoursImage];
    [self.view addSubview:_hoursHand];
    
    //minutes
    NSImage* minutesImage = [NSImage imageNamed:kClockMinuteHandFile];
    _minutesHand = [[NSImageView alloc] initWithFrame:[_clockBody frame]];
    [_minutesHand setImage:minutesImage];
    [self.view addSubview:_minutesHand];
    
    //seconds
    NSImage* secondsImage = [NSImage imageNamed:kClockSecondHandFile];
    _secondsHand = [[NSImageView alloc] initWithFrame:[_clockBody frame]];
    [_secondsHand setImage:secondsImage];
    [self.view addSubview:_secondsHand];

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
