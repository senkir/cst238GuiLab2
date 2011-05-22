//
//  OITSevenSegmentDigitController.h
//  lab2DasClock
//
//  Created by Travis Churchill on 5/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface OITSevenSegmentDigitController : NSViewController {
@private
    NSBox *_segment1;
    NSBox *_segment2;
    NSBox *_segment3;
    NSBox *_segment4;
    NSBox *_segment5;
    NSBox *_segment6;    
    NSBox *_segment7;
    
    NSArray *_segments;
    NSUInteger _value;
    NSUInteger _maxValue; //restricts the maximum value of this state
    NSView*    _parent;
}
@property (nonatomic, retain) IBOutlet NSBox *segment1;
@property (nonatomic, retain) IBOutlet NSBox *segment2;
@property (nonatomic, retain) IBOutlet NSBox *segment3;
@property (nonatomic, retain) IBOutlet NSBox *segment4;
@property (nonatomic, retain) IBOutlet NSBox *segment5;
@property (nonatomic, retain) IBOutlet NSBox *segment6;
@property (nonatomic, retain) IBOutlet NSBox *segment7;

@property (nonatomic, assign) NSUInteger maxValue;
@property (nonatomic, assign) NSUInteger value;

- (id)initWithParentView:(NSView*)parent;
- (void)incrementDigit;
@end
