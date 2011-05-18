//
//  OITSevenSegmentDigitController.m
//  lab2DasClock
//
//  Created by Travis Churchill on 5/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "OITSevenSegmentDigitController.h"


@implementation OITSevenSegmentDigitController

@synthesize segment1 = _segment1;
@synthesize segment2 = _segment2;
@synthesize segment3 = _segment3;
@synthesize segment4 = _segment4;
@synthesize segment5 = _segment5;
@synthesize segment6 = _segment6;
@synthesize segment7 = _segment7;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _segments = [[NSArray alloc] initWithObjects:_segment1, _segment2, _segment3, 
                _segment4, _segment5, _segment6, _segment7, nil];

    }
    
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)clearDisplay {
    for (NSBox* segment in _segments) {
        [segment setTransparent:TRUE];
    }
}
@end
