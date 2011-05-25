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
    [_hoursHandController release];
    _hoursHandController = nil;
    [_minutesHandController release];
    _minutesHandController = nil;
    [_secondsHandController release];
    _secondsHandController = nil;
    [_hoursHand release];
    _hoursHand = nil;
    [_minutesHand release];
    _minutesHand = nil;
    [_secondsHand release];
    _secondsHand = nil;
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
    _hoursHandController = [[OITClockAnalogHand alloc] initWithImageView:_hoursHand];
    
    //minutes
    NSImage* minutesImage = [NSImage imageNamed:kClockMinuteHandFile];
    _minutesHand = [[NSImageView alloc] initWithFrame:[_clockBody frame]];
    [_minutesHand setImage:minutesImage];
    [self.view addSubview:_minutesHand];
    _minutesHandController = [[OITClockAnalogHand alloc] initWithImageView:_minutesHand];
    
    //seconds
    NSImage* secondsImage = [NSImage imageNamed:kClockSecondHandFile];
    _secondsHand = [[NSImageView alloc] initWithFrame:[_clockBody frame]];
    [_secondsHand setImage:secondsImage];
    [self.view addSubview:_secondsHand];
    _secondsHandController =  [[OITClockAnalogHand alloc] initWithImageView:_secondsHand];
    [self initializeTime];
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
    [self initializeTime];
}

/**
 Set the current time
 */
- (void)initializeTime {
    NSLog(@"OITDigitalClockController: initialize time");
    NSCalendar* currentCalendar = [NSCalendar currentCalendar];
    NSDateComponents* timeComponents = [currentCalendar components:NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit fromDate:[NSDate date]];
    NSInteger hourComponent = [timeComponents hour];
    [_hoursHandController setMaxValue:12];
    [_hoursHandController setValue:hourComponent];
    NSUInteger minuteComponent = [timeComponents minute];
    [_minutesHandController setValue:minuteComponent];
    NSUInteger secondComponent = [timeComponents second];
    [_secondsHandController setValue:secondComponent];
    [self relinkAllImages];
    
    NSLog(@"OITDigitalClockController: time set to %lu : %lu : %lu ", [_hoursHandController value], [_minutesHandController value], [_secondsHandController value]);
}

- (void)relinkAllImages {
    [_hoursHand removeFromSuperview];
    [_minutesHand removeFromSuperview];
    [_secondsHand removeFromSuperview];
    [_clockBody addSubview:[_hoursHandController image]];
    [_clockBody addSubview:[_minutesHandController image]];
    [_clockBody addSubview:[_secondsHandController image]];

}
@end
