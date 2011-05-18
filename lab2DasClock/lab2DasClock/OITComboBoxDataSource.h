//
//  OITComboBoxDataSource.h
//  lab2DasClock
//
//  Created by Travis Churchill on 5/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Data source from which to obtain values for the combo box
 */
@interface OITComboBoxDataSource : NSObject <NSComboBoxDataSource>{
@private
    NSArray* _items;
}
@end
