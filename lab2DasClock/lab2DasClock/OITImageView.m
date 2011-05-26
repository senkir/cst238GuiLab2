//
//  OITImageView.m
//  lab2DasClock
//
//  Created by Travis Churchill on 5/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "OITImageView.h"


@implementation OITImageView

@synthesize rotationInDegrees = _rotationInDegrees;

- (void)drawRect:(NSRect)rect {
    
    
//    [self lockFocus];
    
    /**
     * Apply the following transformations:
     *
     * - bring the rotation point to the centre of the image instead of
     *   the default lower, left corner (0,0).
     * - rotate it by 90 degrees, either clock or counter clockwise.
     * - re-translate the rotated image back down to the lower left corner
     *   so that it appears in the right place.
     */
    NSAffineTransform *rotateTF = [NSAffineTransform transform];
//    NSPoint centerPoint = NSMakePoint(self.size.width / 2, self.image.height / 2);
    
//    [rotateTF translateXBy: centerPoint.x yBy: centerPoint.y];
    [rotateTF rotateByDegrees:self.rotationInDegrees];
//    [rotateTF translateXBy: -centerPoint.y yBy: -centerPoint.x];
    [rotateTF concat];
    
//    [self unlockFocus];
    
    [super drawRect:rect];
}

//- (void)setRotationInDegrees:(float)rotationInDegrees {
//    if (_rotationInDegrees != rotationInDegrees {
//        _rotationInDegrees = rotationInDegrees;
//        [self
//    }
//}
@end
