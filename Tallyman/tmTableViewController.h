//
//  tmTableViewController.h
//  Tallyman
//
//  Created by Casey Ward on 3/5/16.
//  Copyright © 2016 Casey Wrd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HandlesMOC.h"

@interface tmTableViewController : UITableViewController <HandlesMOC>

- (void)receiveMOC:(NSManagedObjectContext *)incomingMOC;

@end
