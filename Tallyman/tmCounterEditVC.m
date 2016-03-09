//
//  tmCounterEditVC.m
//  Tallyman
//
//  Created by Casey Ward on 3/7/16.
//  Copyright © 2016 Casey Wrd. All rights reserved.
//

#import "tmCounterEditVC.h"

@interface tmCounterEditVC ()

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) TallyCounter *localTC;



@end

@implementation tmCounterEditVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



- (void)receiveMOC:(NSManagedObjectContext *)incomingMOC {
    self.managedObjectContext = incomingMOC;
    
}

- (void)receiveTallyCounterEntity:(TallyCounter *)tcEntity {
    self.localTC = tcEntity;
    
}

@end
