//
//  TMTableVC-EditTallyCounter.h
//  Tallyman
//
//  Created by Casey Ward on 3/13/16.
//  Copyright © 2016 Casey Wrd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HandlesTallyCounterEntity.h"
#import "HandlesMOC.h"

@interface TMTableVC_EditTallyCounter : UITableViewController <HandlesMOC, HandlesTallyCounterEntity>

- (void)receiveMOC:(NSManagedObjectContext *)incomingMOC;
- (void)receiveTallyCounterEntity:(TallyCounter *)tcEntity;

@end
