

#import "RecordIndexViewController.h"
#import "RecordCreateViewController.h"
#import "RecordShowViewController.h"

#import "RecordTableViewCell.h"

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
    
    // Create Record
    
    RecordCreateViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"RecordCreateViewController"];
    
    [self.navigationController presentViewController:vc animated:YES completion:nil];
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
