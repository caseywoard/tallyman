//
//  TallyCounter+CoreDataProperties.h
//  Tallyman
//
//  Created by Casey Ward on 3/5/16.
//  Copyright © 2016 Casey Wrd. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "TallyCounter.h"

NS_ASSUME_NONNULL_BEGIN

@interface TallyCounter (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *counterName;
@property (nullable, nonatomic, retain) NSNumber *counterCurrentValue;
@property (nullable, nonatomic, retain) NSNumber *counterIncreaseValueBy;
@property (nullable, nonatomic, retain) NSNumber *counterDecreaseValueBy;
@property (nullable, nonatomic, retain) NSNumber *counterResetValue;
@property (nullable, nonatomic, retain) NSData *counterBackGroundImage;
@property (nullable, nonatomic, retain) NSNumber *counterTrackDate;
@property (nullable, nonatomic, retain) NSNumber *counterSetGoal;

@end

NS_ASSUME_NONNULL_END
