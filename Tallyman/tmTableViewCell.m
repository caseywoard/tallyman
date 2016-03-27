//
//  tmTableViewCell.m
//  Tallyman
//
//  Created by Casey Ward on 3/6/16.
//  Copyright © 2016 Casey Wrd. All rights reserved.
//

#import "tmTableViewCell.h"

@interface tmTableViewCell ()



@end

@implementation tmTableViewCell


- (void) setInternalFields:(TallyCounter *)incomingTallyCounter {
    self.localTallyCounter = incomingTallyCounter;
    self.tableCellCounterName.text = incomingTallyCounter.counterName;
    self.tableCellCounterValue.text = [NSString stringWithFormat:@"%@",incomingTallyCounter.counterCurrentValue];
    
    //setting label widths
    [self.tableCellCounterName sizeToFit];
    [self.tableCellCounterValue sizeToFit];
    
    //add funtionality to buttons
    [self.decreaseTallyButton addTarget:self action:@selector(decreaseTallyCounterTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.increaseTallyButton addTarget:self action:@selector(increaseTallyCounterTapped) forControlEvents:UIControlEventTouchUpInside];
    
    
}
- (IBAction)decreaseTallyButtonTapped:(id)sender {
    NSInteger integer = [self.tableCellCounterValue.text intValue];
    integer++;
    
}

-(void)decreaseTallyCounterTapped {
    NSInteger decreaseValueByInteger = [self.localTallyCounter.counterDecreaseValueBy intValue];
    NSInteger newValue = [self.localTallyCounter.counterCurrentValue intValue] - decreaseValueByInteger;
    self.localTallyCounter.counterCurrentValue = [NSNumber numberWithInt:(int)newValue];
    //self.tableCellCounterValue.text = [NSString stringWithFormat:@"%ld",(long)newValue];
    self.tableCellCounterValue.text = [NSString stringWithFormat:@"%@", self.localTallyCounter.counterCurrentValue];
}

-(void)increaseTallyCounterTapped {
    NSInteger decreaseValueByInteger = [self.localTallyCounter.counterDecreaseValueBy intValue];
    NSInteger newValue = [self.localTallyCounter.counterCurrentValue intValue] + decreaseValueByInteger;
    self.localTallyCounter.counterCurrentValue = [NSNumber numberWithInt:(int)newValue];
    //self.tableCellCounterValue.text = [NSString stringWithFormat:@"%ld",(long)newValue];
    self.tableCellCounterValue.text = [NSString stringWithFormat:@"%@", self.localTallyCounter.counterCurrentValue];
}


/*
 - (void)saveTallyCounter:(TallyCounter *)aCounter {
 //set input values to local Tally Counter entity
 self.localTC.counterName = self.counterNameLabel.text;
 self.localTC.counterCurrentValue = [NSNumber numberWithInteger:[self.currentValueLabel.text integerValue]];
 self.localTC.counterIncreaseValueBy = [NSNumber numberWithInteger:[self.increaseValueLabel.text integerValue]];
 self.localTC.counterDecreaseValueBy = [NSNumber numberWithInteger:[self.decreaseValueLabel.text integerValue]];
 //self.localTC.counterResetValue = [NSNumber numberWithInteger:self.resetValueLabel.text integerValue]];
 
 //save local Tally Counter entity object to moc
 NSError *err;
 BOOL saveSuccess = [self.managedObjectContext save:&err];
 if (!saveSuccess) {
 @throw [NSException exceptionWithName:NSGenericException reason:@"Couldn't save." userInfo:@{NSUnderlyingErrorKey:err}];
 }
 NSLog(@"entity saved");
 }
 */



@end
