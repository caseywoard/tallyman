//
//  HandlesMOC.h
//  Tallyman
//
//  Created by Casey Ward on 3/6/16.
//  Copyright © 2016 Casey Wrd. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol HandlesMOC <NSObject>

@optional
- (void)receiveMOC:(NSManagedObjectContext *)incomingMOC;

@end
