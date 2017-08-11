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


#import <UIKit/UIKit.h>

@class Record;

@interface RecordShowViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel* distanceLabel;
@property (nonatomic, strong) IBOutlet UILabel* firstSetRepsLabel;
@property (nonatomic, strong) IBOutlet UILabel* firstSetWeightLabel;
@property (nonatomic, strong) IBOutlet UISwitch* isAdvancedSwitch;
@property (nonatomic, strong) IBOutlet UISwitch* isMetricSwitch;
@property (nonatomic, strong) IBOutlet UILabel* lapCountLabel;
@property (nonatomic, strong) IBOutlet UILabel* secondSetRepsLabel;
@property (nonatomic, strong) IBOutlet UILabel* secondSetWeightLabel;
@property (nonatomic, strong) IBOutlet UILabel* standardRepsLabel;
@property (nonatomic, strong) IBOutlet UILabel* standardSetWeightLabel;
@property (nonatomic, strong) IBOutlet UILabel* thirdSetRepsLabel;
@property (nonatomic, strong) IBOutlet UILabel* thirdSetWeightLabel;
@property (nonatomic, strong) IBOutlet UILabel* xsetCountLabel;
@property (nonatomic, strong) IBOutlet UIView* advancedView;
@property (nonatomic, strong) IBOutlet UIView* standardView;

@property (nonatomic, strong) IBOutlet UIBarButtonItem* rightBarButtonItem;

@property (nonatomic, strong) Record* record;

@end
          
