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
    NSAssert(self.xsetCountLabel != nil, @"self.xsetCountLabel should not be nil");
    NSAssert(self.standardView != nil, @"self.standardView should not be nil");
    NSAssert(self.advancedView != nil, @"self.advancedView should not be nil");
    
    
}

- (void)viewWillAppear:(BOOL)animated {

    self.distanceLabel.text = [NSString stringWithFormat:@"Distance: %@", [@(self.record.distance) stringValue]];
    self.firstSetRepsLabel.text = [NSString stringWithFormat:@"1st Set Reps: %@",[@(self.record.firstSetReps) stringValue]];
    self.firstSetWeightLabel.text = [NSString stringWithFormat:@"1st Set Weight: %@",[@(self.record.firstSetWeight) stringValue]];
    self.isAdvancedSwitch.on = self.record.isAdvanced;
    self.isMetricSwitch.on = self.record.isMetric;
    self.lapCountLabel.text = [NSString stringWithFormat:@"Laps: %@", [@(self.record.lapCount) stringValue]];
    self.secondSetRepsLabel.text = [NSString stringWithFormat:@"2nd Set Reps: %@",[@(self.record.secondSetReps) stringValue]];
    self.secondSetWeightLabel.text = [NSString stringWithFormat:@"2nd Set Weight: %@",[@(self.record.secondSetWeight) stringValue]];
    self.standardRepsLabel.text = [NSString stringWithFormat:@"Reps: %@",[@(self.record.standardReps) stringValue]];
    self.standardSetWeightLabel.text = [NSString stringWithFormat:@"Weight: %@",[@(self.record.standardSetWeight) stringValue]];
    self.thirdSetRepsLabel.text = [NSString stringWithFormat:@"3rd Set Reps: %@",[@(self.record.thirdSetReps) stringValue]];
    self.thirdSetWeightLabel.text = [NSString stringWithFormat:@"3rd Set Weight: %@",[@(self.record.thirdSetWeight) stringValue]];
    self.xsetCountLabel.text = [NSString stringWithFormat:@"Sets: %@", [@(self.record.xsetCount) stringValue]];
    
    if (self.isAdvancedSwitch.isOn) {
        self.advancedView.hidden = false;
        self.standardView.hidden = true;
    } else {
        self.advancedView.hidden = true;
        self.standardView.hidden = false;
    }
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
- (IBAction)tappedAdvancedSwitch:(id)sender {
    
    if (self.isAdvancedSwitch.isOn) {
        self.advancedView.hidden = false;
        self.standardView.hidden = true;
    } else {
        self.advancedView.hidden = true;
        self.standardView.hidden = false;
    }
}

- (IBAction)touchRightBarButton:(id)sender {
    
    // Edit Record
    
    RecordEditViewController* vc = [self.storyboard instantiateViewControllerWithIdentifier:@"RecordEditViewController"];
    vc.record = self.record;
    [self.navigationController presentViewController:vc animated:YES completion:nil];
}


@end
