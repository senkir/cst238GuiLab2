//
//  lab2DasClockAppDelegate.h
//  lab2DasClock
//
//  Created by Travis Churchill on 5/15/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "OITTimeModel.h"

@interface lab2DasClockAppDelegate : NSObject <NSApplicationDelegate> {
@private
    NSWindow *window;
    NSView *_view;
    NSViewController<OITTimeModelDelegate> *_viewController;
    NSButton *_submitButton;
    NSComboBox *_dropdownBox;
    id<NSComboBoxDataSource>          _comboBoxDataSource;
    OITTimeModel      *_timeModel;
}

@property (assign) IBOutlet NSWindow *window;
@property (nonatomic, assign) IBOutlet NSView *view;

@property (nonatomic, assign) IBOutlet NSButton *submitButton;
@property (nonatomic, assign) IBOutlet NSComboBox *dropdownBox;

- (IBAction) submitButtonWasSelected:(id)sender;
- (void)showDigitalClock;
@end
