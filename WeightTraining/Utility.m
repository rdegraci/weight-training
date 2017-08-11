//
//  Utility.m
//  WeightTraining
//

/*
 
 Copyright 2017 Rodney Degracia
 
 Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation
 files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy,
 modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software
 is furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
 WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
 COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
 ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 
 */

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
