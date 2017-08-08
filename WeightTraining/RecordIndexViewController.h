
#import <UIKit/UIKit.h>

@interface RecordIndexViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITableView* recordTableView;
@property (nonatomic, strong) IBOutlet UISegmentedControl* segmentControl;
@property (nonatomic, strong) IBOutlet UIBarButtonItem* rightBarButtonItem;

@property (nonatomic, strong) NSArray* records;

- (void)reloadTableView;
- (void)pulledToRefresh;

@end
        