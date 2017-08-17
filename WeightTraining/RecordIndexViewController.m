/*
 
 Copyright 2017 Rodney Degracia
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation
 files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy,
 modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software
 is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
 WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
 ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 */


#import "RecordIndexViewController.h"
#import "RecordCreateViewController.h"
#import "RecordShowViewController.h"
#import "StationIndexViewController.h"
#import "RecordTableViewCell.h"
#import "constants.h"
#import "Record+CoreDataClass.h"

#import "AppDelegate.h"


@interface RecordIndexViewController ()

@end

@implementation RecordIndexViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSAssert(self.rightBarButtonItem != nil, @"self.rightBarButtonItem should not be nil");
    self.rightBarButtonItem.target = self;
    self.rightBarButtonItem.action = @selector(touchRightBarButton:);
    self.navigationItem.rightBarButtonItem = self.rightBarButtonItem;
    
    NSAssert(self.segmentControl != nil, @"self.segmentControl should not be nil");
    
    [self.recordTableView registerNib:[UINib nibWithNibName:@"RecordTableViewCell" bundle:nil] forCellReuseIdentifier:@"RecordTableViewCell"];
    
    UIRefreshControl* refreshControl = [[UIRefreshControl alloc] init];
    self.recordTableView.refreshControl = refreshControl;
    [refreshControl addTarget:self action:@selector(pulledToRefresh) forControlEvents:UIControlEventValueChanged];
}

- (void)viewWillAppear:(BOOL)animated {
    [self reloadTableView];
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


#pragma mark - Functions

- (void)pulledToRefresh {
    [self reloadTableView];
    [self.recordTableView.refreshControl endRefreshing];
}

- (void)reloadTableView {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Record"];
    NSManagedObjectContext* managedObjectContext = [(AppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
    NSError *error = nil;
    NSArray *results = [managedObjectContext executeFetchRequest:request error:&error];
    if (!results) {
    } else {
        self.records = results;
    }
    [self.recordTableView reloadData];
}



#pragma mark - IBActions

- (IBAction)touchRightBarButton:(id)sender {
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Station"];
    NSManagedObjectContext* managedObjectContext = [(AppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
    NSError *error = nil;
    NSArray *results = [managedObjectContext executeFetchRequest:request error:&error];
    if (!results) {
    } else {
        if (results.count > 0) {
            
            // Create Record
            
            RecordCreateViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"RecordCreateViewController"];
            
            [self.navigationController presentViewController:vc animated:YES completion:nil];
            
        } else {
            UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Unable to create Record"
                                                                           message:@"You will need to create a Station first"
                                                                    preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction * action) {
                                                                      dispatch_async(dispatch_get_main_queue(), ^{
                                                                          self.tabBarController.selectedIndex = kStationTabBarControllerPosition;
                                                                          UINavigationController* navController = (UINavigationController*)[self.tabBarController.viewControllers objectAtIndex:kStationTabBarControllerPosition];
                                                                          StationIndexViewController* stationIndexController = [navController.viewControllers firstObject];
                                                                          [stationIndexController touchRightBarButton:nil];
                                                                      });
                                                                  }];
            
            [alert addAction:defaultAction];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }

    

}




#pragma mark - UITableViewDelegate Protocol

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Show Record
    
    RecordShowViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"RecordShowViewController"];
    vc.record = [self.records objectAtIndex:[indexPath row]];
    
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - UITableViewDatasource Delegate Protocol

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    RecordTableViewCell* cell = (RecordTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"RecordTableViewCell"];
    NSAssert(cell != nil, @"cell should not be nil");
    
    
    
    Record* record = [self.records objectAtIndex:[indexPath row]];
    [cell configureWithRecord:record];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.records count];
}


@end
