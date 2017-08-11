
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


#import "StationIndexViewController.h"
#import "StationCreateViewController.h"
#import "StationShowViewController.h"

#import "StationTableViewCell.h"

#import "Station+CoreDataClass.h"

#import "AppDelegate.h"


@interface StationIndexViewController ()

@end

@implementation StationIndexViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSAssert(self.rightBarButtonItem != nil, @"self.rightBarButtonItem should not be nil");
    self.rightBarButtonItem.target = self;
    self.rightBarButtonItem.action = @selector(touchRightBarButton:);
    self.navigationItem.rightBarButtonItem = self.rightBarButtonItem;
    
    NSAssert(self.segmentControl != nil, @"self.segmentControl should not be nil");
    
    [self.stationTableView registerNib:[UINib nibWithNibName:@"StationTableViewCell" bundle:nil] forCellReuseIdentifier:@"StationTableViewCell"];
    
    UIRefreshControl* refreshControl = [[UIRefreshControl alloc] init];
    self.stationTableView.refreshControl = refreshControl;
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
    [self.stationTableView.refreshControl endRefreshing];
}

- (void)reloadTableView {
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Station"];
    NSManagedObjectContext* managedObjectContext = [(AppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
    NSError *error = nil;
    NSArray *results = [managedObjectContext executeFetchRequest:request error:&error];
    if (!results) {
    } else {
        self.stations = results;
    }
    [self.stationTableView reloadData];
}



#pragma mark - IBActions

- (IBAction)touchRightBarButton:(id)sender {
    
    // Create Station
    
    StationCreateViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"StationCreateViewController"];
    
    [self.navigationController presentViewController:vc animated:YES completion:nil];
}




#pragma mark - UITableViewDelegate Protocol

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // Show Station
    
    StationShowViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"StationShowViewController"];
    vc.station = [self.stations objectAtIndex:[indexPath row]];
    
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - UITableViewDatasource Delegate Protocol

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    StationTableViewCell* cell = (StationTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"StationTableViewCell"];
    NSAssert(cell != nil, @"cell should not be nil");
    
    
    
    Station* station = [self.stations objectAtIndex:[indexPath row]];
    [cell configureWithStation:station];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.stations count];
}


@end
