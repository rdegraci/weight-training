
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


#import "StationShowViewController.h"
#import "StationEditViewController.h"
#import "RecordCreateViewController.h"
#import "RecordShowViewController.h"
#import "RecordTableViewCell.h"

#import "Station+CoreDataClass.h"
#import "AppDelegate.h"


@interface StationShowViewController ()

@end

@implementation StationShowViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Edit
    NSAssert(self.rightBarButtonItem != nil, @"self.rightBarButtonItem should not be nil");
    self.rightBarButtonItem.target = self;
    self.rightBarButtonItem.action = @selector(touchRightBarButton:);
    self.navigationItem.rightBarButtonItem = self.rightBarButtonItem;
    
    NSAssert(self.armSettingLabel != nil, @"self.armSettingLabel should not be nil");
    NSAssert(self.backSettingLabel != nil, @"self.backSettingLabel should not be nil");
    NSAssert(self.chestSettingLabel != nil, @"self.chestSettingLabel should not be nil");
    NSAssert(self.isAdvancedSwitch != nil, @"self.isAdvancedSwitch should not be nil");
    NSAssert(self.isMetricSwitch != nil, @"self.isMetricSwitch should not be nil");
    NSAssert(self.nameLabel != nil, @"self.nameLabel should not be nil");
    NSAssert(self.seatSettingLabel != nil, @"self.seatSettingLabel should not be nil");
    NSAssert(self.recordTableView != nil, @"recordTableView should not be nil");
    
    [self.recordTableView registerNib:[UINib nibWithNibName:@"RecordTableViewCell" bundle:nil] forCellReuseIdentifier:@"RecordTableViewCell"];

    self.records = [NSArray new];
}

- (void)viewWillAppear:(BOOL)animated {
    self.armSettingLabel.text = [@(self.station.armSetting) stringValue];
    self.backSettingLabel.text = [@(self.station.backSetting) stringValue];
    self.chestSettingLabel.text = [@(self.station.chestSetting) stringValue];
    self.isAdvancedSwitch.on = self.station.isAdvanced;
    self.isMetricSwitch.on = self.station.isMetric;
    self.nameLabel.text = self.station.name;
    self.seatSettingLabel.text = [@(self.station.seatSetting) stringValue];
 
        [self reloadRecordTableView];
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

- (void)reloadRecordTableView {

    self.records = self.station.records.allObjects;
    [self.recordTableView reloadData];
}


#pragma mark - IBActions

- (IBAction)touchAddSessionButton:(id)sender {
    
    // Add Record
    
    RecordCreateViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"RecordCreateViewController"];
    
    vc.addToStation = ^(Record* record){
        [self.station addRecordsObject:record];
    };
    
    [self presentViewController:vc animated:true completion:nil];
}


- (IBAction)touchRightBarButton:(id)sender {
    
    // Edit Station
    
    StationEditViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"StationEditViewController"];
    vc.station = self.station;
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
