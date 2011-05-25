//
//  OITClockAnalogHand.h
//  lab2DasClock
//
//  Created by Travis Churchill on 5/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "OITAbstractClockElementController.h"

@interface OITClockAnalogHand : OITAbstractClockElementController {
@private
    NSImageView *_handImageView;
}
- (id)initWithImageView:(NSImageView*) imageView;
- (void)rotateByDegrees:(NSUInteger) degrees;
- (NSImageView*)image;
@end
