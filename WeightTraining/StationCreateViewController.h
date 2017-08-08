
#import <UIKit/UIKit.h>

@class Station;

@interface StationCreateViewController : UIViewController

@property (nonatomic, strong) IBOutlet UITextField* armSettingTextField;
@property (nonatomic, strong) IBOutlet UITextField* backSettingTextField;
@property (nonatomic, strong) IBOutlet UITextField* chestSettingTextField;
@property (nonatomic, strong) IBOutlet UITextField* firstSetRepsTextField;
@property (nonatomic, strong) IBOutlet UITextField* firstSetWeightTextField;
@property (nonatomic, strong) IBOutlet UISwitch* isAdvancedSwitch;
@property (nonatomic, strong) IBOutlet UISwitch* isMetricSwitch;
@property (nonatomic, strong) IBOutlet UITextField* nameTextField;
@property (nonatomic, strong) IBOutlet UITextField* repCountTextField;
@property (nonatomic, strong) IBOutlet UITextField* seatSettingTextField;
@property (nonatomic, strong) IBOutlet UITextField* secondSetRepsTextField;
@property (nonatomic, strong) IBOutlet UITextField* secondSetWeightTextField;
@property (nonatomic, strong) IBOutlet UITextField* thirdSetRepsTextField;
@property (nonatomic, strong) IBOutlet UITextField* thirdSetWeightTextField;
@property (nonatomic, strong) IBOutlet UITextField* xsetCountTextField;

@property (strong, nonatomic) IBOutlet UIView *settingsView;
@property (strong, nonatomic) IBOutlet UIView *advancedView;


@property (nonatomic, strong) Station* station;

@property (nonatomic, strong) IBOutlet UIBarButtonItem* rightBarButtonItem;
@property (nonatomic, strong) IBOutlet UIBarButtonItem* leftBarButtonItem;
- (IBAction)advancedSettingsSwitchToggled:(id)sender;

@end
          
