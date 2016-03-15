//
//  TMSecondNavigationController.m
//  Tallyman
//
//  Created by Casey Ward on 3/14/16.
//  Copyright © 2016 Casey Wrd. All rights reserved.
//

#import "TMSecondNavigationController.h"

@interface TMSecondNavigationController ()

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end

@implementation TMSecondNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)receiveMOC:(NSManagedObjectContext *)incomingMOC {
    self.managedObjectContext = incomingMOC;
    id<HandlesMOC> child = (id<HandlesMOC>)self.viewControllers[0];
    [child receiveMOC:self.managedObjectContext];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
