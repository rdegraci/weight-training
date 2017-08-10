
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
          
