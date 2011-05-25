//
//  OITAnalogClockController.h
//  lab2DasClock
//
//  Created by Travis Churchill on 5/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "OITClockController.h"

@interface OITAnalogClockController : OITClockController {
@private
    NSImageView *_clockBody;
    NSImageView *_secondsHand;
    NSImageView *_minutesHand;
    NSImageView *_hoursHand;
}
@property (nonatomic, retain) IBOutlet NSImageView *clockBody;
//@property (nonatomic, retain) IBOutlet NSImageView *secondsHand;
//@property (nonatomic, retain) IBOutlet NSImageView *minutesHand;
//@property (nonatomic, retain) IBOutlet NSImageView *hoursHand;

@end
