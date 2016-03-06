//
//  tmNavigationController.m
//  Tallyman
//
//  Created by Casey Ward on 3/5/16.
//  Copyright © 2016 Casey Wrd. All rights reserved.
//

#import "tmNavigationController.h"

@implementation tmNavigationController

- (void)receiveMOC:(NSManagedObjectContext *)incomingMOC {
    NSLog(@"receiveMOC was called in tmNavigationController");
}

@end
