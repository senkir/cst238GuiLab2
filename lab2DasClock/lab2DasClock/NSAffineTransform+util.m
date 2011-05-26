//
//  OITImageHelper.m
//  lab2DasClock
//
//  Created by Travis Churchill on 5/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NSAffineTransform+util.h"

@implementation NSAffineTransform (Rotation)
+ (NSAffineTransform *)transformRotatingAroundPoint:(NSPoint) p byDegrees:(CGFloat) deg
{
    NSAffineTransform * transform = [NSAffineTransform transform];
    [transform translateXBy: p.x yBy: p.y];
    [transform rotateByDegrees:deg];
    [transform translateXBy: -p.x yBy: -p.y];
    return transform;
}
@end
