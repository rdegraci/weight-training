
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
    
    self.createdAtDatePicker.date = record.createdAt;
    
    self.distanceLabel.text = [@(record.distance) stringValue];
    
    self.firstSetRepsLabel.text = [@(record.firstSetReps) stringValue];
    
    self.firstSetWeightLabel.text = [@(record.firstSetWeight) stringValue];
    
    [self.isAdvancedSwitch setOn:record.isAdvanced];
    
    [self.isMetricSwitch setOn:record.isMetric];
    
    self.lapCountLabel.text = [@(record.lapCount) stringValue];
    
    self.secondSetRepsLabel.text = [@(record.secondSetReps) stringValue];
    
    self.secondSetWeightLabel.text = [@(record.secondSetWeight) stringValue];
    
    self.standardRepsLabel.text = [@(record.standardReps) stringValue];
    
    self.standardSetWeightLabel.text = [@(record.standardSetWeight) stringValue];
    
    self.thirdSetRepsLabel.text = [@(record.thirdSetReps) stringValue];
    
    self.thirdSetWeightLabel.text = [@(record.thirdSetWeight) stringValue];
    
    self.updatedAtDatePicker.date = record.updatedAt;
    
    self.xsetCountLabel.text = [@(record.xsetCount) stringValue];
    
}
@end
