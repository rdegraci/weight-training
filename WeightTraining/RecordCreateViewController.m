

#import "RecordCreateViewController.h"

#import "Record+CoreDataClass.h"
#import "AppDelegate.h"


@interface RecordCreateViewController ()

@end

@implementation RecordCreateViewController


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
    
    
    NSAssert(self.distanceTextField != nil, @"self.distanceTextField should not be nil");
    NSAssert(self.firstSetRepsTextField != nil, @"self.firstSetRepsTextField should not be nil");
    NSAssert(self.firstSetWeightTextField != nil, @"self.firstSetWeightTextField should not be nil");
    NSAssert(self.isAdvancedSwitch != nil, @"self.isAdvancedSwitch should not be nil");
    NSAssert(self.isMetricSwitch != nil, @"self.isMetricSwitch should not be nil");
    NSAssert(self.lapCountTextField != nil, @"self.lapCountTextField should not be nil");
    NSAssert(self.secondSetRepsTextField != nil, @"self.secondSetRepsTextField should not be nil");
    NSAssert(self.secondSetWeightTextField != nil, @"self.secondSetWeightTextField should not be nil");
    NSAssert(self.standardRepsTextField != nil, @"self.standardRepsTextField should not be nil");
    NSAssert(self.standardSetWeightTextField != nil, @"self.standardSetWeightTextField should not be nil");
    NSAssert(self.thirdSetRepsTextField != nil, @"self.thirdSetRepsTextField should not be nil");
    NSAssert(self.thirdSetWeightTextField != nil, @"self.thirdSetWeightTextField should not be nil");
    NSAssert(self.xsetCountTextField != nil, @"self.xsetCountTextField should not be nil");
    
    NSManagedObjectContext* managedObjectContext = [(AppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
    self.record = [NSEntityDescription insertNewObjectForEntityForName:@"Record" inManagedObjectContext:managedObjectContext];

    
    self.record.createdAt = [NSDate date];
    self.record.distance = 0;
    self.record.firstSetReps = 0;
    self.record.firstSetWeight = 0;
    self.record.isAdvanced = false;
    self.record.isMetric = false;
    self.record.lapCount = 0;
    self.record.secondSetReps = 0;
    self.record.secondSetWeight = 0;
    self.record.standardReps = 0;
    self.record.standardSetWeight = 0;
    self.record.thirdSetReps = 0;
    self.record.thirdSetWeight = 0;
    self.record.updatedAt = [NSDate date];
    self.record.xsetCount = 0;
    
    self.distanceTextField.text = [@(self.record.distance) stringValue];
    self.firstSetRepsTextField.text = [@(self.record.firstSetReps) stringValue];
    self.firstSetWeightTextField.text = [@(self.record.firstSetWeight) stringValue];
    self.isAdvancedSwitch.on = self.record.isAdvanced;
    self.isMetricSwitch.on = self.record.isMetric;
    self.lapCountTextField.text = [@(self.record.lapCount) stringValue];
    self.secondSetRepsTextField.text = [@(self.record.secondSetReps) stringValue];
    self.secondSetWeightTextField.text = [@(self.record.secondSetWeight) stringValue];
    self.standardRepsTextField.text = [@(self.record.standardReps) stringValue];
    self.standardSetWeightTextField.text = [@(self.record.standardSetWeight) stringValue];
    self.thirdSetRepsTextField.text = [@(self.record.thirdSetReps) stringValue];
    self.thirdSetWeightTextField.text = [@(self.record.thirdSetWeight) stringValue];
    self.xsetCountTextField.text = [@(self.record.xsetCount) stringValue];
    
    
    self.advancedView.hidden = true;
    self.standardView.hidden = false;
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


#pragma mark - IBActions

- (IBAction)tapAdvancedSettingsSwitch:(id)sender {
    
    if (self.isAdvancedSwitch.isOn) {
        self.standardView.hidden = true;
        self.advancedView.hidden = false;
    } else {
        self.standardView.hidden = false;
        self.advancedView.hidden = true;
    }
}

- (IBAction)touchLeftBarButton:(id)sender {
    
    // Cancel
    
    NSManagedObjectContext* managedObjectContext = [(AppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
    [managedObjectContext deleteObject:self.record];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)touchRightBarButton:(id)sender {
    
    // Save
    
    if (self.record) {
        
        self.record.createdAt = [NSDate date];
        
        NSNumberFormatter *distanceNumberFormatter = [[NSNumberFormatter alloc] init];
        distanceNumberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
        self.record.distance = [[distanceNumberFormatter numberFromString:self.distanceTextField.text] integerValue];
        
        
        NSNumberFormatter *firstSetRepsNumberFormatter = [[NSNumberFormatter alloc] init];
        firstSetRepsNumberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
        self.record.firstSetReps = [[firstSetRepsNumberFormatter numberFromString:self.firstSetRepsTextField.text] integerValue];
        
        
        NSNumberFormatter *firstSetWeightNumberFormatter = [[NSNumberFormatter alloc] init];
        firstSetWeightNumberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
        self.record.firstSetWeight = [[firstSetWeightNumberFormatter numberFromString:self.firstSetWeightTextField.text] integerValue];
        
        self.record.isAdvanced = self.isAdvancedSwitch.isOn;
        self.record.isMetric = self.isMetricSwitch.isOn;
        
        NSNumberFormatter *lapCountNumberFormatter = [[NSNumberFormatter alloc] init];
        lapCountNumberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
        self.record.lapCount = [[lapCountNumberFormatter numberFromString:self.lapCountTextField.text] integerValue];
        
        
        NSNumberFormatter *secondSetRepsNumberFormatter = [[NSNumberFormatter alloc] init];
        secondSetRepsNumberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
        self.record.secondSetReps = [[secondSetRepsNumberFormatter numberFromString:self.secondSetRepsTextField.text] integerValue];
        
        
        NSNumberFormatter *secondSetWeightNumberFormatter = [[NSNumberFormatter alloc] init];
        secondSetWeightNumberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
        self.record.secondSetWeight = [[secondSetWeightNumberFormatter numberFromString:self.secondSetWeightTextField.text] integerValue];
        
        
        NSNumberFormatter *standardRepsNumberFormatter = [[NSNumberFormatter alloc] init];
        standardRepsNumberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
        self.record.standardReps = [[standardRepsNumberFormatter numberFromString:self.standardRepsTextField.text] integerValue];
        
        
        NSNumberFormatter *standardSetWeightNumberFormatter = [[NSNumberFormatter alloc] init];
        standardSetWeightNumberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
        self.record.standardSetWeight = [[standardSetWeightNumberFormatter numberFromString:self.standardSetWeightTextField.text] integerValue];
        
        
        NSNumberFormatter *thirdSetRepsNumberFormatter = [[NSNumberFormatter alloc] init];
        thirdSetRepsNumberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
        self.record.thirdSetReps = [[thirdSetRepsNumberFormatter numberFromString:self.thirdSetRepsTextField.text] integerValue];
        
        
        NSNumberFormatter *thirdSetWeightNumberFormatter = [[NSNumberFormatter alloc] init];
        thirdSetWeightNumberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
        self.record.thirdSetWeight = [[thirdSetWeightNumberFormatter numberFromString:self.thirdSetWeightTextField.text] integerValue];
        
        self.record.updatedAt = [NSDate date];
        
        NSNumberFormatter *xsetCountNumberFormatter = [[NSNumberFormatter alloc] init];
        xsetCountNumberFormatter.numberStyle = NSNumberFormatterDecimalStyle;
        self.record.xsetCount = [[xsetCountNumberFormatter numberFromString:self.xsetCountTextField.text] integerValue];
        
        if (self.addToStation) {
            self.addToStation((self.record));
        }

        
        NSManagedObjectContext* managedObjectContext = [(AppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
        NSError* error;
        [managedObjectContext save:&error];
        if (error) {
            UIAlertController* alertController= [UIAlertController alertControllerWithTitle:@"Unable to save Record" message:@"Try again later" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction* alertAction =[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                [alertController dismissViewControllerAnimated:YES completion:nil];
            }];
            [alertController addAction:alertAction];
            [self presentViewController:alertController animated:YES completion:nil];
        } 
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}


@end
