//
//  OITAbstractClockElementController.m
//  lab2DasClock
//
//  Created by Travis Churchill on 5/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "OITAbstractClockElementController.h"


@implementation OITAbstractClockElementController

@synthesize maxValue = _maxValue;
@synthesize value = _value;

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

- (void)incrementDigit {
    //default does nothing
}

- (void)updateDisplay {
    //default does nothing
}
@end
