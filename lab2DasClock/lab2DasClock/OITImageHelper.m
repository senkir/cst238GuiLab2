//
//  OITImageHelper.m
//  lab2DasClock
//
//  Created by Travis Churchill on 5/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "OITImageHelper.h"

//#define M_PI 3.14159265358979323846 /* pi */

@implementation OITImageHelper

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

+(void) rotate:(NSImage *)image byDegrees:(NSInteger)degrees {
    NSAffineTransform* rotationTransform = [NSAffineTransform transform];
    [rotationTransform rotateByDegrees:5];
    [rotationTransform concat];
}
@end
