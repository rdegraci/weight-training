//
//  Utility.h
//  WeightTraining
//
//  Created by Rodney Degracia on 7/27/17.
//  Copyright © 2017 Rodney Degracia. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Station;
@class Record;

@interface Utility : NSObject

+ (Record*)recordWithMaxWeightOfStation:(Station*)station;

@end
