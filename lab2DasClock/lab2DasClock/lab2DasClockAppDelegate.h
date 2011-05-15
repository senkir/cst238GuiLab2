//
//  lab2DasClockAppDelegate.h
//  lab2DasClock
//
//  Created by Travis Churchill on 5/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface lab2DasClockAppDelegate : NSObject <NSApplicationDelegate> {
@private
    NSWindow *window;
}

@property (assign) IBOutlet NSWindow *window;

@end
