//
//  OITClockAnalogHand.m
//  lab2DasClock
//
//  Created by Travis Churchill on 5/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "OITClockAnalogHand.h"


@implementation OITClockAnalogHand

- (id)initWithImageView:(NSImageView*) imageView {
    self = [super init];
    if (self) {
        _handImageView = [imageView retain];
        [self setMaxValue:60];
    }
    return self;
}

- (void)dealloc {
    [_handImageView release];
    _handImageView = nil;
    [super dealloc];
}

- (void)setValue:(NSUInteger)value {
    [super setValue:value];
    [self updateDisplay];
}

#pragma mark OITClockAnalogHand

- (void)incrementDigit {
    //do stuff specific to analog clocks
    [self setValue:[self value] + 1];
    [self updateDisplay];
}

- (void)updateDisplay {
    //refresh the image if necessary
    NSUInteger degrees = round(( self.value / self.maxValue ) * 360);
    [self rotateByDegrees:degrees];
}

static inline double rad(int alpha)
{
    return ((alpha * pi)/180);
}

- (void)rotateByDegrees:(NSUInteger) alpha {
//    NSSize size = [[_handImageView image] size];
//    
//    NSImage* rotatedImage = [[NSImage alloc] initWithSize:size];
//    
//    NSPoint center = NSMakePoint(size.width / 2.0 , size.height / 2.0);
//    
//    NSAffineTransform *transform = [NSAffineTransform transform];
//    [rotatedImage lockFocus];
//    [transform translateXBy:center.x yBy:center.y];
//    [transform rotateByDegrees:degrees];
//    [transform translateXBy:-center.x yBy:-center.y];
//    [transform concat];
//    
//    [[_handImageView image] drawAtPoint:NSZeroPoint fromRect:NSZeroRect operation:NSCompositeCopy fraction:1.0 ];
//    [rotatedImage unlockFocus];
//    [_handImageView setImage:rotatedImage];
//    [_handImageView setNeedsDisplay];
//    
    
    NSImage* image = [_handImageView image];
    
    // alternate implementation
    float factorW, factorH, dW, dH;
    NSAffineTransform *centreOp, *rotateOp;
    NSImage *tmpImage;
    NSPoint startPoint;
    NSGraphicsContext* graphicsContext;
    BOOL wasAntialiasing;
    NSImageInterpolation previousImageInterpolation;
    
    if (0 == alpha)
        return;
    factorW = fabs(cos(rad(alpha)));
    factorH = fabs(sin(rad(alpha)));
    dW = [image size].width * factorW + [image size].height * factorH;
    dH = [image size].width * factorH + [image size].height * factorW;
    tmpImage = [[NSImage alloc] initWithSize: NSMakeSize(dW, dH)];
    
    centreOp = [NSAffineTransform transform];
    [centreOp translateXBy: dW / 2 yBy: dH / 2];
    rotateOp = [NSAffineTransform transform];
    [rotateOp rotateByDegrees: alpha];
    [rotateOp appendTransform: centreOp];
    
    [image setMatchesOnMultipleResolution: NO];
    [image setUsesEPSOnResolutionMismatch: YES];
    [tmpImage lockFocus];
    graphicsContext = [NSGraphicsContext currentContext];
    wasAntialiasing = [graphicsContext shouldAntialias];
    previousImageInterpolation = [graphicsContext imageInterpolation];
    [graphicsContext setShouldAntialias: YES];
    [graphicsContext setImageInterpolation: NSImageInterpolationHigh];
    
    [rotateOp concat];
    startPoint = NSMakePoint(-[image size].width / 2, -[image
                                                        size].height / 2);
    [image drawAtPoint: startPoint
              fromRect: NSMakeRect(0, 0, [image size].width, [image
                                                              size].height)
             operation: NSCompositeCopy
              fraction: 1.0];
    
    [graphicsContext setShouldAntialias: wasAntialiasing];
    [graphicsContext setImageInterpolation:
     previousImageInterpolation];
    [tmpImage unlockFocus];
    [tmpImage setDataRetained: YES];
    [tmpImage setScalesWhenResized: YES];
    
    [_handImageView setImage:tmpImage];
    [_handImageView setNeedsDisplay:TRUE];
}

- (NSImageView*)image {
    return _handImageView;
}
@end
