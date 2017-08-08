

#import "RecordShowViewController.h"
#import "RecordEditViewController.h"

#import "Record+CoreDataClass.h"
#import "AppDelegate.h"


@interface RecordShowViewController ()

@end

@implementation RecordShowViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Edit
    NSAssert(self.rightBarButtonItem != nil, @"self.rightBarButtonItem should not be nil");
    self.rightBarButtonItem.target = self;
    self.rightBarButtonItem.action = @selector(touchRightBarButton:);
    self.navigationItem.rightBarButtonItem = self.rightBarButtonItem;
    
    NSAssert(self.createdAtDatePicker != nil, @"self.createdAtDatePicker should not be nil");
    NSAssert(self.distanceLabel != nil, @"self.distanceLabel should not be nil");
    NSAssert(self.firstSetRepsLabel != nil, @"self.firstSetRepsLabel should not be nil");
    NSAssert(self.firstSetWeightLabel != nil, @"self.firstSetWeightLabel should not be nil");
    NSAssert(self.isAdvancedSwitch != nil, @"self.isAdvancedSwitch should not be nil");
    NSAssert(self.isMetricSwitch != nil, @"self.isMetricSwitch should not be nil");
    NSAssert(self.lapCountLabel != nil, @"self.lapCountLabel should not be nil");
    NSAssert(self.secondSetRepsLabel != nil, @"self.secondSetRepsLabel should not be nil");
    NSAssert(self.secondSetWeightLabel != nil, @"self.secondSetWeightLabel should not be nil");
    NSAssert(self.standardRepsLabel != nil, @"self.standardRepsLabel should not be nil");
    NSAssert(self.standardSetWeightLabel != nil, @"self.standardSetWeightLabel should not be nil");
    NSAssert(self.thirdSetRepsLabel != nil, @"self.thirdSetRepsLabel should not be nil");
    NSAssert(self.thirdSetWeightLabel != nil, @"self.thirdSetWeightLabel should not be nil");
    NSAssert(self.updatedAtDatePicker != nil, @"self.updatedAtDatePicker should not be nil");
    NSAssert(self.xsetCountLabel != nil, @"self.xsetCountLabel should not be nil");
    
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    self.createdAtDatePicker.date = self.record.createdAt;
    self.distanceLabel.text = [@(self.record.distance) stringValue];
    self.firstSetRepsLabel.text = [@(self.record.firstSetReps) stringValue];
    self.firstSetWeightLabel.text = [@(self.record.firstSetWeight) stringValue];
    self.isAdvancedSwitch.enabled = self.record.isAdvanced;
    self.isMetricSwitch.enabled = self.record.isMetric;
    self.lapCountLabel.text = [@(self.record.lapCount) stringValue];
    self.secondSetRepsLabel.text = [@(self.record.secondSetReps) stringValue];
    self.secondSetWeightLabel.text = [@(self.record.secondSetWeight) stringValue];
    self.standardRepsLabel.text = [@(self.record.standardReps) stringValue];
    self.standardSetWeightLabel.text = [@(self.record.standardSetWeight) stringValue];
    self.thirdSetRepsLabel.text = [@(self.record.thirdSetReps) stringValue];
    self.thirdSetWeightLabel.text = [@(self.record.thirdSetWeight) stringValue];
    self.updatedAtDatePicker.date = self.record.updatedAt;
    self.xsetCountLabel.text = [@(self.record.xsetCount) stringValue];
    
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


#pragma mark - IBActions

- (IBAction)touchRightBarButton:(id)sender {
    
    // Edit Record
    
    RecordEditViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"RecordEditViewController"];
    vc.record = self.record;
    [self.navigationController presentViewController:vc animated:YES completion:nil];
}


@end
