
#import <UIKit/UIKit.h>

@interface StationIndexViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITableView* stationTableView;
@property (nonatomic, strong) IBOutlet UISegmentedControl* segmentControl;
@property (nonatomic, strong) IBOutlet UIBarButtonItem* rightBarButtonItem;

@property (nonatomic, strong) NSArray* stations;

- (void)reloadTableView;
- (void)pulledToRefresh;

@end
        