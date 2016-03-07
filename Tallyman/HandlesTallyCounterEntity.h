//
//  HandlesTallyCounterEntity.h
//  Tallyman
//
//  Created by Casey Ward on 3/6/16.
//  Copyright © 2016 Casey Wrd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TallyCounter.h"

@protocol HandlesTallyCounterEntity <NSObject>

- (void)receiveTallyCounterEntity:(TallyCounter *)tcEntity;

@end
