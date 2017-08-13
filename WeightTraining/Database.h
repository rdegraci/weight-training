//
//  Database.h
//  WeightTraining
//
//  Created by Rodney Degracia on 8/12/17.
//  Copyright © 2017 Rodney Degracia. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Record;
@class Station;

@interface Database : NSObject

+ (Record*)recordWithMaxWeightOfStation:(Station*)station;

+ (NSArray*)upperBodyStations;
+ (NSArray*)coreBodyStations;
+ (NSArray*)lowerBodyStations;

@end
