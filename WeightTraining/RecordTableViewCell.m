
#import "RecordTableViewCell.h"
#import "Record+CoreDataClass.h"

@implementation RecordTableViewCell


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


- (void)configureWithRecord:(Record*)record {
    
    if (record.isAdvanced) {
        self.textLabel.text = [NSString stringWithFormat:@"S1: R:%@ W:%@ - S2: R:%@ W:%@ - S3: R:%@ W:%@",
                               [@(record.firstSetReps) stringValue],
                               [@(record.firstSetWeight) stringValue],
                               [@(record.secondSetReps) stringValue],
                               [@(record.secondSetWeight) stringValue],
                               [@(record.thirdSetReps) stringValue],
                               [@(record.thirdSetWeight) stringValue]];
        
        self.detailTextLabel.text = [record.updatedAt description];
    } else {
        
        self.textLabel.text = [NSString stringWithFormat:@"S:%@ R:%@ W:%@ ",
                                [@(record.xsetCount) stringValue],
                                [@(record.standardReps) stringValue],
                                [@(record.standardSetWeight) stringValue]];
    }
    
    self.detailTextLabel.text = [record.updatedAt description];
        
}
@end
