
#import <UIKit/UIKit.h>

@class Station;

@interface StationShowViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UILabel* armSettingLabel;
@property (nonatomic, strong) IBOutlet UILabel* backSettingLabel;
@property (nonatomic, strong) IBOutlet UILabel* chestSettingLabel;



@property (nonatomic, strong) IBOutlet UISwitch* isAdvancedSwitch;
@property (nonatomic, strong) IBOutlet UISwitch* isMetricSwitch;
@property (nonatomic, strong) IBOutlet UILabel* nameLabel;

@property (nonatomic, strong) IBOutlet UILabel* seatSettingLabel;






@property (nonatomic, strong) IBOutlet UIBarButtonItem* rightBarButtonItem;


@property (nonatomic, strong) Station* station;
@property (nonatomic, strong) NSArray* records;

@property (strong, nonatomic) IBOutlet UIView *positionView;

@property (nonatomic, strong) IBOutlet UITableView* recordTableView;

@end
          
