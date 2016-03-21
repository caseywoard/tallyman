//
//  TMTableVC-EditTallyCounter.m
//  Tallyman
//
//  Created by Casey Ward on 3/13/16.
//  Copyright © 2016 Casey Wrd. All rights reserved.
//

#import "TMTableVC-EditTallyCounter.h"

@interface TMTableVC_EditTallyCounter ()

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) TallyCounter *localTC;

@property (weak, nonatomic) IBOutlet UITextField *counterNameLabel;
//current value ui elements
@property (weak, nonatomic) IBOutlet UITextField *currentValueLabel;
//increase value ui elements
@property (weak, nonatomic) IBOutlet UITextField *increaseValueLabel;
//decrease value ui elements
@property (weak, nonatomic) IBOutlet UITextField *decreaseValueLabel;

//@property (strong,nonatomic) NSNumber *localCurrentValue;


@end

@implementation TMTableVC_EditTallyCounter

- (void)viewWillAppear:(BOOL)animated {
    if (!self.localTC) {
        self.localTC = [NSEntityDescription insertNewObjectForEntityForName:@"TallyCounter" inManagedObjectContext:self.managedObjectContext];
        self.counterNameLabel.text = @"";
        self.currentValueLabel.text = [NSString stringWithFormat:@"%d",0];
        self.increaseValueLabel.text = [NSString stringWithFormat:@"%d",1];
        self.decreaseValueLabel.text = [NSString stringWithFormat:@"%d",1];
        
    } else {
        self.counterNameLabel.text = self.localTC.counterName;
        self.currentValueLabel.text = [NSString stringWithFormat:@"%@", self.localTC.counterCurrentValue];
        self.increaseValueLabel.text = [NSString stringWithFormat:@"%@", self.localTC.counterIncreaseValueBy];
        self.decreaseValueLabel.text = [NSString stringWithFormat:@"%@", self.localTC.counterDecreaseValueBy];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
     //self.tableView.sectionHeaderHeight = [self.tableView
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        NSLog(@"this tableView height function was called");
        return 0.01;
    }
    
    return 3.0;
}

- (void)receiveMOC:(NSManagedObjectContext *)incomingMOC {
    self.managedObjectContext = incomingMOC;
}

- (void)receiveTallyCounterEntity:(TallyCounter *)tcEntity {
    self.localTC = tcEntity;
    
}

#pragma mark - UI element functions
//current value button actions
- (IBAction)decreaseCurrentValueTapped:(id)sender {
    NSInteger integer =[self.currentValueLabel.text intValue];
    integer--;
    self.currentValueLabel.text = [NSString stringWithFormat:@"%ld", (long)integer];
}

- (IBAction)increaseCurrentValueTapped:(id)sender {
    NSInteger integer =[self.currentValueLabel.text intValue];
    integer++;
    self.currentValueLabel.text = [NSString stringWithFormat:@"%ld", (long)integer];
    //NSNumber  *aNumber = [NSNumber numberWithInteger: [self.increaseValueLabel.text integerValue]];
    //aNumber++;
}

//increase value button actions
- (IBAction)increaseValueUpTapped:(id)sender {
    NSInteger integer =[self.increaseValueLabel.text intValue];
    integer++;
    self.increaseValueLabel.text = [NSString stringWithFormat:@"%ld", (long)integer];
}

- (IBAction)increaseValueDownTapped:(id)sender {
    NSInteger integer =[self.increaseValueLabel.text intValue];
    integer--;
    self.increaseValueLabel.text = [NSString stringWithFormat:@"%ld", (long)integer];
}

//decrease value button actions

- (IBAction)decreaseValueUpTapped:(id)sender {
    NSInteger integer =[self.decreaseValueLabel.text intValue];
    integer++;
    self.decreaseValueLabel.text = [NSString stringWithFormat:@"%ld", (long)integer];
}
- (IBAction)decreaseValueDownTapped:(id)sender {
    NSInteger integer =[self.decreaseValueLabel.text intValue];
    integer--;
    self.decreaseValueLabel.text = [NSString stringWithFormat:@"%ld", (long)integer];
}


- (int)increaseMethod:(int)passedValue {
    
    return passedValue++;
}

- (IBAction)saveBtnTapped:(id)sender {
    [self saveTallyCounter:self.localTC];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancelBtnTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

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

- (void)savedToDoEntity {
    NSError *err;
    BOOL saveSuccess = [self.managedObjectContext save:&err];
    if (!saveSuccess) {
        @throw [NSException exceptionWithName:NSGenericException reason:@"Couldn't save." userInfo:@{NSUnderlyingErrorKey:err}];
    }
    NSLog(@"entity saved");
}
#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}
//
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
//    return 0;
//}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



@end
