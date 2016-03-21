//
//  tmCounterDetailViewController.m
//  Tallyman
//
//  Created by Casey Ward on 3/5/16.
//  Copyright © 2016 Casey Wrd. All rights reserved.
//

#import "tmCounterDetailViewController.h"

@interface tmCounterDetailViewController ()

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) TallyCounter *localTC;
@property (weak, nonatomic) IBOutlet UITextView *currentTallyValueLabel;

@end

@implementation tmCounterDetailViewController

- (void)receiveMOC:(NSManagedObjectContext *)incomingMOC {
    self.managedObjectContext = incomingMOC;
    
}

- (void)receiveTallyCounterEntity:(TallyCounter *)tcEntity {
    self.localTC = tcEntity;
    
}

@end
