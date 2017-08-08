
#import "StationTableViewCell.h"
#import "Station+CoreDataClass.h"
#import "Record+CoreDataClass.h"

#import "Utility.h"

@implementation StationTableViewCell


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


- (void)configureWithStation:(Station*)station {
    
    Record* record = [Utility recordWithMaxWeightOfStation:station];
    
    
    self.textLabel.text = station.name;
    self.detailTextLabel.text = [NSString stringWithFormat:@"Maxweight = %@", @(record.standardSetWeight)];
    
}



@end
