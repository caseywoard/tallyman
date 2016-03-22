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

@end
