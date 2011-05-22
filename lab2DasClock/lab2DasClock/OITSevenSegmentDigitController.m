//
//  OITSevenSegmentDigitController.m
//  lab2DasClock
//
//  Created by Travis Churchill on 5/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "OITSevenSegmentDigitController.h"

@interface OITSevenSegmentDigitController (Private) 
- (void)clearDisplay;
- (void)updateDisplay;
@end

@implementation OITSevenSegmentDigitController

@synthesize segment1 = _segment1;
@synthesize segment2 = _segment2;
@synthesize segment3 = _segment3;
@synthesize segment4 = _segment4;
@synthesize segment5 = _segment5;
@synthesize segment6 = _segment6;
@synthesize segment7 = _segment7;

@synthesize maxValue = _maxValue;
@synthesize value = _value;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _segments = [[NSArray alloc] initWithObjects:_segment1, _segment2, _segment3, 
                _segment4, _segment5, _segment6, _segment7, nil];

    }
    
    return self;
}

- (id)initWithParentView:(NSView *)parent {
    self = [super initWithNibName:@"OITSevenSegmentDigitController" bundle:nil];
    if (self) {
        _parent = [parent retain];
        _value = 0;
    }
    return self;
}

- (void)dealloc
{
    [_segments release];
    _segments = nil;
    [_parent release];
    _parent = nil;
    [super dealloc];
}

#pragma mark OITSevenSegmentDigitController
/**
 Set the maximum value for this digit in terms of its state.
 @params maxValue if greater than 9, becomes 9.
 */
- (void)setMaxValue:(NSUInteger)maxValue {
    if (_maxValue != maxValue) {
        maxValue = (maxValue > 9) ? 9 : maxValue;
        _maxValue = maxValue;
    }
}

/**
 Set the current value of this digit to something specific.
 Value will be modded based on maximum for this digit.
 */
- (void)setValue:(NSUInteger)value {
    if (_value  != value) {
        _value = value % _maxValue;
    }
}

- (void)incrementDigit {
    [self setValue:self.value + 1];
    //todo: notify delegate if this digit rolls over
    [self updateDisplay];
}

/**
 Update display based on current value of this digit
 */
- (void)updateDisplay {
    NSArray* displayedSegments = nil;
    [self clearDisplay];
    switch (_value) {
        case 0:
            displayedSegments = [[NSArray alloc] initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7", nil];
            break;
        case 1:
            displayedSegments = [[NSArray alloc] initWithObjects:@"3", @"6", nil];
            break;
        case 2:
            displayedSegments = [[NSArray alloc] initWithObjects:@"1",@"3",@"4",@"5",@"7", nil];
            break;
        case 3:
            displayedSegments = [[NSArray alloc] initWithObjects:@"1",@"3",@"4",@"6",@"7", nil];
            break;
        case 4:
            displayedSegments = [[NSArray alloc] initWithObjects:@"2",@"3",@"4",@"6", nil];
            break;
        case 5:
            displayedSegments = [[NSArray alloc] initWithObjects:@"1",@"2",@"4",@"6",@"7", nil];
            break;
        case 6:
            displayedSegments = [[NSArray alloc] initWithObjects:@"1",@"2",@"4",@"5",@"6",@"7", nil];
            break;
        case 7:
            displayedSegments = [[NSArray alloc] initWithObjects:@"1",@"3",@"6", nil];
            break;
        case 8:
            displayedSegments = [[NSArray alloc] initWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7", nil];
            break;
        case 9:
            displayedSegments = [[NSArray alloc] initWithObjects:@"1",@"2",@"3",@"4",@"6", nil];
            break;
        default:
            NSLog(@"OITSevenSegmentDigitController: invalid value.  cannot display values");
            break;
    }
    for (NSString* segment in displayedSegments) {
        [[_segments objectAtIndex:[segment intValue]-1] setTransparent:FALSE];
    }    
}

/**
 reset 
 */
- (void)clearDisplay {
    for (NSBox* segment in _segments) {
        [segment setTransparent:TRUE];
    }
}
@end
