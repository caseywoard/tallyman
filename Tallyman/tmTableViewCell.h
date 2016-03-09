//
//  tmTableViewCell.h
//  Tallyman
//
//  Created by Casey Ward on 3/6/16.
//  Copyright © 2016 Casey Wrd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TallyCounter.h"

@interface tmTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *tableCellCounterName;
@property (weak, nonatomic) IBOutlet UILabel *tableCellCounterValue;
@property (strong, nonatomic) TallyCounter *localTallyCounter;
- (void) setInternalFields:(TallyCounter *)incomingTallyCounter;

@end
