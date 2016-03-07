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

- (void) setInternalFields:(TallyCounter *)incomingTallyCounter;

@end
