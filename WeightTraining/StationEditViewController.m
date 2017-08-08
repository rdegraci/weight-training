

#import "StationEditViewController.h"

#import "Station+CoreDataClass.h"
#import "AppDelegate.h"


@interface StationEditViewController ()

@end

@implementation StationEditViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Save
    NSAssert(self.rightBarButtonItem != nil, @"self.rightBarButtonItem should not be nil");
    self.rightBarButtonItem.target = self;
    self.rightBarButtonItem.action = @selector(touchRightBarButton:);
    self.navigationItem.rightBarButtonItem = self.rightBarButtonItem;
    
    // Cancel
    NSAssert(self.leftBarButtonItem != nil, @"self.leftBarButtonItem should not be nil");
    self.leftBarButtonItem.target = self;
    self.leftBarButtonItem.action = @selector(touchLeftBarButton:);
    self.navigationItem.leftBarButtonItem = self.leftBarButtonItem;
    
    NSAssert(self.armSettingTextField != nil, @"self.armSettingTextField should not be nil");
    NSAssert(self.backSettingTextField != nil, @"self.backSettingTextField should not be nil");
    NSAssert(self.chestSettingTextField != nil, @"self.chestSettingTextField should not be nil");

    NSAssert(self.firstSetRepsTextField != nil, @"self.firstSetRepsTextField should not be nil");
    NSAssert(self.firstSetWeightTextField != nil, @"self.firstSetWeightTextField should not be nil");
    NSAssert(self.isAdvancedSwitch != nil, @"self.isAdvancedSwitch should not be nil");
    NSAssert(self.isMetricSwitch != nil, @"self.isMetricSwitch should not be nil");
    NSAssert(self.nameTextField != nil, @"self.nameTextField should not be nil");
    NSAssert(self.repCountTextField != nil, @"self.repCountTextField should not be nil");
    NSAssert(self.seatSettingTextField != nil, @"self.seatSettingTextField should not be nil");
    NSAssert(self.secondSetRepsTextField != nil, @"self.secondSetRepsTextField should not be nil");
    NSAssert(self.secondSetWeightTextField != nil, @"self.secondSetWeightTextField should not be nil");
    NSAssert(self.thirdSetRepsTextField != nil, @"self.thirdSetRepsTextField should not be nil");
    NSAssert(self.thirdSetWeightTextField != nil, @"self.thirdSetWeightTextField should not be nil");

    NSAssert(self.xsetCountTextField != nil, @"self.xsetCountTextField should not be nil");
    
    
    
    
    self.armSettingTextField.text = [@(self.station.armSetting) stringValue];
    self.backSettingTextField.text = [@(self.station.backSetting) stringValue];
    self.chestSettingTextField.text = [@(self.station.chestSetting) stringValue];

    self.firstSetRepsTextField.text = [@(self.station.firstSetReps) stringValue];
    self.firstSetWeightTextField.text = [@(self.station.firstSetWeight) stringValue];
    self.isAdvancedSwitch.enabled = self.station.isAdvanced;
    self.isMetricSwitch.enabled = self.station.isMetric;
    self.nameTextField.text = self.station.name;
    self.repCountTextField.text = [@(self.station.repCount) stringValue];
    self.seatSettingTextField.text = [@(self.station.seatSetting) stringValue];
    self.secondSetRepsTextField.text = [@(self.station.secondSetReps) stringValue];
    self.secondSetWeightTextField.text = [@(self.station.secondSetWeight) stringValue];
    self.thirdSetRepsTextField.text = [@(self.station.thirdSetReps) stringValue];
    self.thirdSetWeightTextField.text = [@(self.station.thirdSetWeight) stringValue];

    self.xsetCountTextField.text = [@(self.station.xsetCount) stringValue];
    
    self.isAdvancedSwitch.on = false;
    self.advancedView.hidden = true;
    self.settingsView.hidden = false;
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

- (IBAction)touchLeftBarButton:(id)sender {
    
    // Cancel
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)touchRightBarButton:(id)sender {
    
    // Save
    
    if (self.station) {
        
        
        NSNumberFormatter *armSettingNumberFormatter = [[NSNumberFormatter alloc] init];
        armSettingNumberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
        self.station.armSetting = [[armSettingNumberFormatter numberFromString:self.armSettingTextField.text] integerValue];
        
        
        NSNumberFormatter *backSettingNumberFormatter = [[NSNumberFormatter alloc] init];
        backSettingNumberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
        self.station.backSetting = [[backSettingNumberFormatter numberFromString:self.backSettingTextField.text] integerValue];
        
        
        NSNumberFormatter *chestSettingNumberFormatter = [[NSNumberFormatter alloc] init];
        chestSettingNumberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
        self.station.chestSetting = [[chestSettingNumberFormatter numberFromString:self.chestSettingTextField.text] integerValue];

        
        NSNumberFormatter *firstSetRepsNumberFormatter = [[NSNumberFormatter alloc] init];
        firstSetRepsNumberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
        self.station.firstSetReps = [[firstSetRepsNumberFormatter numberFromString:self.firstSetRepsTextField.text] integerValue];
        
        
        NSNumberFormatter *firstSetWeightNumberFormatter = [[NSNumberFormatter alloc] init];
        firstSetWeightNumberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
        self.station.firstSetWeight = [[firstSetWeightNumberFormatter numberFromString:self.firstSetWeightTextField.text] integerValue];
        
        self.station.isAdvanced = @(self.isAdvancedSwitch.enabled);
        self.station.isMetric = @(self.isMetricSwitch.enabled);
        self.station.name = self.nameTextField.text;
        
        NSNumberFormatter *repCountNumberFormatter = [[NSNumberFormatter alloc] init];
        repCountNumberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
        self.station.repCount = [[repCountNumberFormatter numberFromString:self.repCountTextField.text] integerValue];
        
        
        NSNumberFormatter *seatSettingNumberFormatter = [[NSNumberFormatter alloc] init];
        seatSettingNumberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
        self.station.seatSetting = [[seatSettingNumberFormatter numberFromString:self.seatSettingTextField.text] integerValue];
        
        
        NSNumberFormatter *secondSetRepsNumberFormatter = [[NSNumberFormatter alloc] init];
        secondSetRepsNumberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
        self.station.secondSetReps = [[secondSetRepsNumberFormatter numberFromString:self.secondSetRepsTextField.text] integerValue];
        
        
        NSNumberFormatter *secondSetWeightNumberFormatter = [[NSNumberFormatter alloc] init];
        secondSetWeightNumberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
        self.station.secondSetWeight = [[secondSetWeightNumberFormatter numberFromString:self.secondSetWeightTextField.text] integerValue];
        
        
        NSNumberFormatter *thirdSetRepsNumberFormatter = [[NSNumberFormatter alloc] init];
        thirdSetRepsNumberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
        self.station.thirdSetReps = [[thirdSetRepsNumberFormatter numberFromString:self.thirdSetRepsTextField.text] integerValue];
        
        
        NSNumberFormatter *thirdSetWeightNumberFormatter = [[NSNumberFormatter alloc] init];
        thirdSetWeightNumberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
        self.station.thirdSetWeight = [[thirdSetWeightNumberFormatter numberFromString:self.thirdSetWeightTextField.text] integerValue];
        
        self.station.updatedAt = [NSDate date];
        
        NSNumberFormatter *xsetCountNumberFormatter = [[NSNumberFormatter alloc] init];
        xsetCountNumberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
        self.station.xsetCount = [[xsetCountNumberFormatter numberFromString:self.xsetCountTextField.text] integerValue];
        
        
        
        NSManagedObjectContext* managedObjectContext = [(AppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
        NSError* error;
        [managedObjectContext save:&error];
        if (error) {
            UIAlertController* alertController= [UIAlertController alertControllerWithTitle:@"Unable to save Station" message:@"Try again later" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction* alertAction =[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [alertController dismissViewControllerAnimated:YES completion:nil];
            }];
            [alertController addAction:alertAction];
            [self presentViewController:alertController animated:YES completion:nil];
        } 
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (IBAction)tapAdvancedSwitch:(id)sender {
    
    if (self.isAdvancedSwitch.isOn) {
        self.advancedView.hidden = false;
        self.settingsView.hidden = true;
    } else {
        self.advancedView.hidden = true;
        self.settingsView.hidden = false;
    }
}


@end
