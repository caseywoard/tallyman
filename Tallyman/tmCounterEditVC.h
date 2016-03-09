//
//  tmCounterEditVC.h
//  Tallyman
//
//  Created by Casey Ward on 3/7/16.
//  Copyright © 2016 Casey Wrd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HandlesTallyCounterEntity.h"
#import "HandlesMOC.h"

@interface tmCounterEditVC : UIViewController <HandlesTallyCounterEntity, HandlesMOC>

- (void)receiveMOC:(NSManagedObjectContext *)incomingMOC;

@end
