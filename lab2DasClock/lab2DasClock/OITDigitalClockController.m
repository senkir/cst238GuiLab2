//
//  OITDigitalClockController.m
//  lab2DasClock
//
//  Created by Travis Churchill on 5/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "OITDigitalClockController.h"


@implementation OITDigitalClockController

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

- (void)updateTime {
    NSLog(@"OITDigitalClockController: updating display");
    
}
@end
