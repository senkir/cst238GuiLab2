//
//  OITComboBoxDataSource.m
//  lab2DasClock
//
//  Created by Travis Churchill on 5/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "OITComboBoxDataSource.h"


@implementation OITComboBoxDataSource

- (id)init
{
    self = [super init];
    if (self) {
        _items = [[NSArray alloc] initWithObjects:@"Digital", @"Analog", @"Other", nil];
    }
    
    return self;
}

- (void)dealloc
{
    [_items release];
    [super dealloc];
}
- (id)comboBox:(NSComboBox *)aComboBox objectValueForItemAtIndex:(NSInteger)index {
    return [_items objectAtIndex:index];
}

- (NSInteger)numberOfItemsInComboBox:(NSComboBox *)aComboBox {
    return [_items count];
}
@end
