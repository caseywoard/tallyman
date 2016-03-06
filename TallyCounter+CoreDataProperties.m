//
//  TallyCounter+CoreDataProperties.m
//  Tallyman
//
//  Created by Casey Ward on 3/5/16.
//  Copyright © 2016 Casey Wrd. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "TallyCounter+CoreDataProperties.h"

@implementation TallyCounter (CoreDataProperties)

@dynamic counterName;
@dynamic counterCurrentValue;
@dynamic counterIncreaseValueBy;
@dynamic counterDecreaseValueBy;
@dynamic counterResetValue;
@dynamic counterBackGroundImage;
@dynamic counterTrackDate;
@dynamic counterSetGoal;

@end
