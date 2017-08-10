

#import "StationShowViewController.h"
#import "StationEditViewController.h"

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
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    self.armSettingLabel.text = [@(self.station.armSetting) stringValue];
    self.backSettingLabel.text = [@(self.station.backSetting) stringValue];
    self.chestSettingLabel.text = [@(self.station.chestSetting) stringValue];
    self.isAdvancedSwitch.on = self.station.isAdvanced;
    self.isMetricSwitch.on = self.station.isMetric;
    self.nameLabel.text = self.station.name;
    self.seatSettingLabel.text = [@(self.station.seatSetting) stringValue];
 
    
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
    
    // Edit Station
    
    StationEditViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"StationEditViewController"];
    vc.station = self.station;
    [self.navigationController presentViewController:vc animated:YES completion:nil];
}


@end
