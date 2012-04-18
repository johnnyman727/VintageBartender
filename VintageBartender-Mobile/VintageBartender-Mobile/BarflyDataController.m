//
//  BarflyDataController.m
//  Vintage Bartender-Mobile
//
//  Created by Jon McKay on 3/28/12.
//  Copyright (c) 2012 Olin College of Engineering. All rights reserved.
//

#import "BarflyDataController.h"
#import "Barfly.h"
#import "VintageBartenderFirstViewController.h"

@interface BarflyDataController()
- (BOOL)searchTermInName:(NSArray *)searchStrings forBarflyName:(NSString *)name;
@end

@implementation BarflyDataController

@synthesize barflyList=_barflyList, filteredBarflyList=_filteredBarflyList, vbc = _vbc;

-(id)init {
    if (self = [super init]) {
        
        return self;
    }
    return nil;
}

-(NSUInteger)countOfBarflyList {
    return [self.filteredBarflyList count];
}

-(Barfly *)objectInBarflyListAtIndex:(NSUInteger)index {
    return [self.filteredBarflyList objectAtIndex:index];
}

-(void)addBarfly:(Barfly *)newBarfly {
    // Send a barfly up to the server
    [[RKObjectManager sharedManager] postObject:newBarfly delegate:self]; 
    
    //Request a the new barfly list after a few miliseconds to allow for server processing (with the barfly we just added)
    [self performSelector:@selector(requestBarflyListFromServer) withObject:nil afterDelay:.50];
}

-(void)addBarflyWithName:(NSString *)name email:(NSString *)email {
    Barfly *barfly;

    // Create a barfly
    barfly = [[Barfly alloc] initWithName:name email:email];
    
    // Add the barfly
    [self addBarfly:barfly];
}

-(void)requestBarflyListFromServer {
    // Ask the server for the barfly list
    [[RKObjectManager sharedManager] loadObjectsAtResourcePath:@"/people" delegate:self];
}

- (void)objectLoader:(RKObjectLoader*)objectLoader didLoadObjects:(NSArray*)objects {
    //RKLogInfo(@"Load collection of Barflys: %@", objects);
    
    // Add the objects to the instance variable for later usage
    self.barflyList = self.filteredBarflyList = objects;
    
    // Tell vbc
    [self.vbc.barflyTable reloadData];
    
}

- (void)objectLoader:(RKObjectLoader *)objectLoader didFailWithError:(NSError *)error {
    // Something went wrong loading the barflys!
    RKLogInfo(@"Load collection of Barflys FAILED: %@", error);
    
    if (error.code != 1001) {
        // Set up an alert
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No network connection" 
                                                        message:@"Please check your network connection." 
                                                       delegate:nil 
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        // Show the alert
        [alert show];
    }
}

- (void)filterBarflies:(NSString *)searchText {
    
    // Set our old filtered list to empty
    NSMutableArray *tempFiltered = [[NSMutableArray alloc] init];
    
    // Break the input text into seperate words, if need be
    NSArray *splitSearchText = [searchText componentsSeparatedByString:@" "];
    
    // Iterate through our barfly list
    for (Barfly *barfly in self.barflyList) {
        
        
        // Check if their is a match
        if ([self searchTermInName:splitSearchText forBarflyName:barfly.name]) {
            [tempFiltered addObject:barfly];
        }
        
    }
    
    // If the filtered list has no items, hide the table
    if ([tempFiltered count] == 0) {
        [self.vbc.barflyTable setHidden:YES];
    }
    // Else update the filtered list and the table
    else {
        // Attach list to the retained filered list
        self.filteredBarflyList = tempFiltered;
        
        // Update the table
        [self.vbc.barflyTable reloadData];
    }
    
}

- (BOOL)searchTermInName:(NSArray *)searchStrings forBarflyName:(NSString *)name{

    // Iterate through each of the filter strings
    for (NSString *searchItem in searchStrings) {
           
        // If the search text matches part or all of one of the names
        if ([[name lowercaseString] rangeOfString:[searchItem lowercaseString]].location != NSNotFound) {
               
            // There is a match
            return YES;
        }
    }
    // There is no match
    return NO;
}

@end
