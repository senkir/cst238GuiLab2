//
//  OITTimeModel.m
//  lab2DasClock
//
//  Created by Travis Churchill on 5/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "OITTimeModel.h"


@implementation OITTimeModel

@synthesize referenceDate = _referenceDate;
@synthesize delegate = _delegate;

- (id)init
{
    self = [super init];
    if (self) {
        //get the datetime right now
        _referenceDate = [NSDate date];

    }
    
    return self;
}

- (void)dealloc
{
    [_updateTimer invalidate];
    [_updateTimer release];
    [_delegate release];
    [super dealloc];
}

- (void)setDelegate:(id<OITTimeModelDelegate>)delegate {
    if (delegate != _delegate) {
        [_delegate release];
        _delegate = [_delegate retain];
        //rig a timer for the delegate
        _updateTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeDidChange) userInfo:nil repeats:true];
    }
}

- (void)timeDidChange {
    _referenceDate = [NSDate date];
    if ([_delegate respondsToSelector:@selector(secondsShouldUpdate:)]) {
        [_delegate secondsShouldUpdate:_referenceDate];
    } else  if ([_delegate respondsToSelector:@selector(secondsShouldUpdate:)]) {
        [_delegate minutesShouldUpdate:_referenceDate];
    }
    //todo f
}
@end
