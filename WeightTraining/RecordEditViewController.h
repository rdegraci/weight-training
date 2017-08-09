
#import <UIKit/UIKit.h>

@class Record;

@interface RecordEditViewController : UIViewController

@property (nonatomic, strong) IBOutlet UITextField* distanceTextField;
@property (nonatomic, strong) IBOutlet UITextField* firstSetRepsTextField;
@property (nonatomic, strong) IBOutlet UITextField* firstSetWeightTextField;
@property (nonatomic, strong) IBOutlet UISwitch* isAdvancedSwitch;
@property (nonatomic, strong) IBOutlet UISwitch* isMetricSwitch;
@property (nonatomic, strong) IBOutlet UITextField* lapCountTextField;
@property (nonatomic, strong) IBOutlet UITextField* secondSetRepsTextField;
@property (nonatomic, strong) IBOutlet UITextField* secondSetWeightTextField;
@property (nonatomic, strong) IBOutlet UITextField* standardRepsTextField;
@property (nonatomic, strong) IBOutlet UITextField* standardSetWeightTextField;
@property (nonatomic, strong) IBOutlet UITextField* thirdSetRepsTextField;
@property (nonatomic, strong) IBOutlet UITextField* thirdSetWeightTextField;
@property (nonatomic, strong) IBOutlet UITextField* xsetCountTextField;
@property (nonatomic, strong) IBOutlet UIView* advancedView;
@property (nonatomic, strong) IBOutlet UIView* standardView;

@property (nonatomic, strong) Record* record;

@property (nonatomic, strong) IBOutlet UIBarButtonItem* rightBarButtonItem;
@property (nonatomic, strong) IBOutlet UIBarButtonItem* leftBarButtonItem;

@end
          
