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





@end
