//
//  TMSecondNavigationController.h
//  Tallyman
//
//  Created by Casey Ward on 3/14/16.
//  Copyright © 2016 Casey Wrd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HandlesMOC.h"

@interface TMSecondNavigationController : UINavigationController <HandlesMOC>

- (void)receiveMOC:(NSManagedObjectContext *)incomingMOC;

@end
