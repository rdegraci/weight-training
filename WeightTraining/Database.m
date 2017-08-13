//
//  Database.m
//  WeightTraining
//
//  Created by Rodney Degracia on 8/12/17.
//  Copyright © 2017 Rodney Degracia. All rights reserved.
//

#import "Database.h"
#import "AppDelegate.h"
#import "Station+CoreDataClass.h"
#import "Record+CoreDataClass.h"

@implementation Database

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

+ (NSArray*)upperBodyStations {
 
    AppDelegate* appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext* context = [appDelegate managedObjectContext];
    
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    NSEntityDescription* entity = [NSEntityDescription entityForName:@"Station" inManagedObjectContext:context];
    request.entity = entity;
    
    request.predicate = [NSPredicate predicateWithFormat:@"upperBody == YES"];
    
    NSError* error = nil;
    
    NSArray* array = [context executeFetchRequest:request error:&error];
    
    if (error) {
        return nil;
    } else {
        return array;
    }
}

+ (NSArray*)coreBodyStations {
   
    AppDelegate* appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext* context = [appDelegate managedObjectContext];
    
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    NSEntityDescription* entity = [NSEntityDescription entityForName:@"Station" inManagedObjectContext:context];
    request.entity = entity;
    
    request.predicate = [NSPredicate predicateWithFormat:@"coreBody == YES"];
    
    NSError* error = nil;
    
    NSArray* array = [context executeFetchRequest:request error:&error];
    
    if (error) {
        return nil;
    } else {
        return array;
    }
}

+ (NSArray*)lowerBodyStations {
    
    AppDelegate* appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    NSManagedObjectContext* context = [appDelegate managedObjectContext];
    
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    NSEntityDescription* entity = [NSEntityDescription entityForName:@"Station" inManagedObjectContext:context];
    request.entity = entity;
    
    request.predicate = [NSPredicate predicateWithFormat:@"lowerBody == YES"];
    
    NSError* error = nil;
    
    NSArray* array = [context executeFetchRequest:request error:&error];
    
    if (error) {
        return nil;
    } else {
        return array;
    }
    
}
@end
