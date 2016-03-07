//
//  tmNavigationController.m
//  Tallyman
//
//  Created by Casey Ward on 3/5/16.
//  Copyright © 2016 Casey Wrd. All rights reserved.
//

#import "tmNavigationController.h"

@interface tmNavigationController ()

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end

@implementation tmNavigationController

- (void)receiveMOC:(NSManagedObjectContext *)incomingMOC {
    self.managedObjectContext = incomingMOC;
    id<HandlesMOC> child = (id<HandlesMOC>)self.viewControllers[0];
    [child receiveMOC:self.managedObjectContext];
}

@end
