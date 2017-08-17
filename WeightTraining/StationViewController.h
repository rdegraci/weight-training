//
//  StationViewController.h
//  WeightTraining
//
//  Created by Rodney Degracia on 8/17/17.
//  Copyright © 2017 Rodney Degracia. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Station;

@interface StationViewController : UIViewController

@property (nonatomic, strong) Station* station;
@property (strong, nonatomic) IBOutlet UIButton *workoutTypeButton;

- (NSString*)workoutTypeString;
@end
