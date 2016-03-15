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

@interface tmTableViewController () <UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSFetchedResultsController *fetchResultsController;

@end

@implementation tmTableViewController

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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    id<HandlesMOC, HandlesTallyCounterEntity> child = (id<HandlesMOC, HandlesTallyCounterEntity>)[segue destinationViewController];
    [child receiveMOC:self.managedObjectContext];
    TallyCounter *counter;
    counter = [NSEntityDescription insertNewObjectForEntityForName:@"TallyCounter" inManagedObjectContext:self.managedObjectContext];
    NSLog(@"bar button tapped");
}

- (void)receiveMOC:(NSManagedObjectContext *)incomingMOC {
    self.managedObjectContext = incomingMOC;
   
}

@end
