//
//  tmTableViewController.m
//  Tallyman
//
//  Created by Casey Ward on 3/5/16.
//  Copyright © 2016 Casey Wrd. All rights reserved.
//

#import "tmTableViewController.h"
#import "HandlesTallyCounterEntity.h"
#import "TallyCounter.h"
#import "tmTableViewCell.h"
#import "tmCounterDetailViewController.h"


@interface tmTableViewController () <UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSFetchedResultsController *fetchResultsController;


@end

@implementation tmTableViewController
- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setToolbarHidden:NO animated:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpFetchResultController];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (void)setUpFetchResultController {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    fetchRequest.entity = [NSEntityDescription entityForName:@"TallyCounter" inManagedObjectContext:self.managedObjectContext];
    fetchRequest.predicate = [NSPredicate predicateWithFormat:@"TRUEPREDICATE"];
    fetchRequest.sortDescriptors = @[[[NSSortDescriptor alloc] initWithKey:@"counterName" ascending:YES]];
    
    self.fetchResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:nil];
    self.fetchResultsController.delegate = self;
    
    NSError *err;
    BOOL fetchSucceeded = [self.fetchResultsController performFetch:&err];
    if (!fetchSucceeded) {
        @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:@"Couldn't fetch" userInfo:nil];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [self.fetchResultsController.sections[section] numberOfObjects];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TallyCounter *tallyCounter = self.fetchResultsController.sections[indexPath.section].objects[indexPath.row];
    tmTableViewCell *cell = (tmTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    [cell setInternalFields:tallyCounter];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type newIndexPath:(NSIndexPath *)newIndexPath {
    
    switch (type) {
        case NSFetchedResultsChangeInsert:
            [[self tableView] insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
        case NSFetchedResultsChangeDelete:
            [[self tableView] deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        case NSFetchedResultsChangeUpdate: {
            if ([controller.fetchedObjects count] != 0) {
                tmTableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
                TallyCounter *counter = [controller objectAtIndexPath:indexPath];
                [cell setInternalFields:counter];
                [self saveTallyCounter:counter];
            }
            
            break;
        }
        case NSFetchedResultsChangeMove:
            [[self tableView] deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [[self tableView] insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
    }
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller {
    [self.tableView endUpdates];
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

- (IBAction)increaseValueTapped:(id)sender {
    
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    id<HandlesMOC, HandlesTallyCounterEntity> child = (id<HandlesMOC, HandlesTallyCounterEntity>)[segue destinationViewController];
    [child receiveMOC:self.managedObjectContext];
    TallyCounter *counter;
     if ([sender isMemberOfClass:[UIBarButtonItem class]]) {
        //counter = [NSEntityDescription insertNewObjectForEntityForName:@"TallyCounter" inManagedObjectContext:self.managedObjectContext];
        NSLog(@"bar button tapped");
     } else {
         NSIndexPath *path = [self.tableView indexPathForSelectedRow];
         tmTableViewCell *cell  = (tmTableViewCell *)[self.tableView cellForRowAtIndexPath:path];
         //tmTableViewCell *source = (tmTableViewCell *)sender;
         counter = cell.localTallyCounter;
         NSLog(@"this cell's tally counter name is: %@", counter.counterName);
         [child receiveTallyCounterEntity:counter];
         
         
     }
    
    
}

- (void)receiveMOC:(NSManagedObjectContext *)incomingMOC {
    self.managedObjectContext = incomingMOC;
   
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    [self performSegueWithIdentifier:@"segueToTallyCounterVC" sender:indexPath];
//    NSLog(@"didSelectRowAtIndexPath yeah");
//}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.navigationController setToolbarHidden:YES animated:YES];
}

@end
