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
    
}

@end
