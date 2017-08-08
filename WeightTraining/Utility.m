//
//  Utility.m
//  WeightTraining
//
//  Created by Rodney Degracia on 7/27/17.
//  Copyright © 2017 Rodney Degracia. All rights reserved.
//

#import "Utility.h"
#import "AppDelegate.h"
#import "Station+CoreDataClass.h"
#import "Record+CoreDataClass.h"

@implementation Utility

+ (Record*)recordWithMaxWeightOfStation:(Station*)station {
    
    AppDelegate* appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext* context = [appDelegate managedObjectContext];
    
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    NSEntityDescription* entity = [NSEntityDescription entityForName:@"Record" inManagedObjectContext:context];
    request.entity = entity;
    
    request.predicate = [NSPredicate predicateWithFormat:@"standardSetWeight == max(standardSetWeight) AND station == %@", station ];
    
    NSError* error = nil;
    
    NSArray* array = [context executeFetchRequest:request error:&error];
    
    if (error) {
        return nil;
    } else {
        return [array firstObject];
    }
}

@end
