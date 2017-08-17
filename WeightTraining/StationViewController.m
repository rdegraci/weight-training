//
//  StationViewController.m
//  WeightTraining
//
//  Created by Rodney Degracia on 8/17/17.
//  Copyright © 2017 Rodney Degracia. All rights reserved.
//

#import "StationViewController.h"
#import "Station+CoreDataClass.h"

@interface StationViewController ()

@end

@implementation StationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    if (self.station) {
        [self.workoutTypeButton setTitle:[self workoutTypeString] forState:UIControlStateNormal];
    } else {
        [self.workoutTypeButton setTitle:@"Workout: Upper Body" forState:UIControlStateNormal];
    }
    
}

- (void)superViewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Functions


- (NSString *)workoutTypeString {
    
    NSString* result = @"";
    
    if (self.station.upperBody == true &&
        self.station.coreBody == false &&
        self.station.lowerBody == false) {
        result = @"Workout: Upper Body";
    } else if (self.station.upperBody == true &&
               self.station.coreBody == false &&
               self.station.lowerBody == false) {
        result = @"Workout: Core Body";
    } else if (self.station.upperBody == true &&
               self.station.coreBody == false &&
               self.station.lowerBody == false) {
        result = @"Workout: Lower Body";
    }
    
    return result;
}

#pragma mark - IBActions

- (IBAction)tapWorkoutType:(id)sender {
    
    UIAlertController* actionSheet = [UIAlertController alertControllerWithTitle:@"Workout Type"
                                                                         message:@"Choose the type of workout for this Station"
                                                                  preferredStyle:UIAlertControllerStyleActionSheet];
    
    
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Upper Body" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        self.station.upperBody = true;
        self.station.coreBody = false;
        self.station.lowerBody = false;
        [self.workoutTypeButton setTitle:@"Workout: Upper Body" forState:UIControlStateNormal];
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Core Body" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        self.station.upperBody = false;
        self.station.coreBody = true;
        self.station.lowerBody = false;
        [self.workoutTypeButton setTitle:@"Workout: Core Body" forState:UIControlStateNormal];
        
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Lower Body" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        
        self.station.upperBody = false;
        self.station.coreBody = false;
        self.station.lowerBody = true;
        [self.workoutTypeButton setTitle:@"Workout: Lower Body" forState:UIControlStateNormal];
        
    }]];
    
    [actionSheet addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        
    }]];
    
    [self presentViewController:actionSheet animated:YES completion:nil];
}

@end
