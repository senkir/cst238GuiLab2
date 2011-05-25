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

@end
