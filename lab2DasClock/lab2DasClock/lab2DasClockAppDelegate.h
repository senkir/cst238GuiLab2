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
    NSView *_view;
    NSButton *_submitButton;
    NSComboBox *_dropdownBox;
    id          _comboBoxDataSource;
}

@property (assign) IBOutlet NSWindow *window;
@property (nonatomic, assign) NSView *view;

@property (nonatomic, assign) IBOutlet NSButton *submitButton;
@property (nonatomic, assign) IBOutlet NSComboBox *dropdownBox;

- (IBAction) submitButtonWasSelected:(id)sender;
@end
