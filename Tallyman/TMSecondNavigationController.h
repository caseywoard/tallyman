//
//  TMSecondNavigationController.h
//  Tallyman
//
//  Created by Casey Ward on 3/14/16.
//  Copyright © 2016 Casey Wrd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HandlesMOC.h"
#import "HandlesTallyCounterEntity.h"

@interface TMSecondNavigationController : UINavigationController <HandlesMOC, HandlesTallyCounterEntity>

- (void)receiveMOC:(NSManagedObjectContext *)incomingMOC;
- (void)receiveTallyCounterEntity:(TallyCounter *)tcEntity;

@end
