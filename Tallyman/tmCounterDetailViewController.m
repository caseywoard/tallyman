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
@property (weak, nonatomic) IBOutlet UILabel *labelLabel;


@end

@implementation tmCounterDetailViewController

- (void)viewWillAppear:(BOOL)animated {
    self.labelLabel.text = [NSString stringWithFormat:@"%@",self.localTC.counterCurrentValue];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}


- (void)receiveMOC:(NSManagedObjectContext *)incomingMOC {
    self.managedObjectContext = incomingMOC;
    
}

- (void)receiveTallyCounterEntity:(TallyCounter *)tcEntity {
    self.localTC = tcEntity;
//    self.currentTallyValueLabel.text = [NSString stringWithFormat:@"%@",self.localTC.counterCurrentValue];
}
- (IBAction)decreaseTallyTapped:(id)sender {
    NSInteger decreaseValueByInteger = [self.localTC.counterDecreaseValueBy intValue];
    NSInteger newValue = [self.localTC.counterCurrentValue intValue] - decreaseValueByInteger;
    self.localTC.counterCurrentValue = [NSNumber numberWithInt:(int)newValue];
    //self.tableCellCounterValue.text = [NSString stringWithFormat:@"%ld",(long)newValue];
    self.labelLabel.text = [NSString stringWithFormat:@"%@", self.localTC.counterCurrentValue];
    [self saveTallyCounter:self.localTC];
}
- (IBAction)increaseTallyTapped:(id)sender {
    NSInteger increaseValueByInteger = [self.localTC.counterIncreaseValueBy intValue];
    NSInteger newValue = [self.localTC.counterCurrentValue intValue] + increaseValueByInteger;
    self.localTC.counterCurrentValue = [NSNumber numberWithInt:(int)newValue];
    //self.tableCellCounterValue.text = [NSString stringWithFormat:@"%ld",(long)newValue];
    self.labelLabel.text = [NSString stringWithFormat:@"%@", self.localTC.counterCurrentValue];
    [self saveTallyCounter:self.localTC];
}

- (void)saveTallyCounter:(TallyCounter *)aCounter {
    //save local Tally Counter entity object to moc
    NSError *err;
    BOOL saveSuccess = [self.managedObjectContext save:&err];
    if (!saveSuccess) {
        @throw [NSException exceptionWithName:NSGenericException reason:@"Couldn't save." userInfo:@{NSUnderlyingErrorKey:err}];
    }
    NSLog(@"entity saved");
}

@end
