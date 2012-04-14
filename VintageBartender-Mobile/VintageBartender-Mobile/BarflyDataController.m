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

@implementation BarflyDataController

@synthesize barflyList=_barflyList, vbc = _vbc;

-(id)init {
    if (self = [super init]) {
        
        return self;
    }
    return nil;
}

-(NSUInteger)countOfBarflyList {
    return [self.barflyList count];
}

-(Barfly *)objectInBarflyListAtIndex:(NSUInteger)index {
    return [self.barflyList objectAtIndex:index];
}

-(void)addBarfly:(Barfly *)newBarfly {
    // Send a barfly up to the server
    [[RKObjectManager sharedManager] postObject:newBarfly delegate:self]; 
    
    //Request a the new barfly list (with the barfly we just added)
    [self requestBarflyListFromServer];
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
    RKLogInfo(@"Load collection of Barflys: %@", objects);
    
    // Add the objects to the instance variable for later usage
    self.barflyList = objects;
    
    // Tell vbc
    [self.vbc.barflyTable reloadData];
    
}

- (void)objectLoader:(RKObjectLoader *)objectLoader didFailWithError:(NSError *)error {
    // Something went wrong loading the barflys!
    RKLogInfo(@"Load collection of Barflys FAILED: %@", error);
    
    // Set up an alert
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"No network connection" 
                                                    message:@"Please check your network connection." 
                                                   delegate:nil 
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    // Show the alert
    [alert show];
}




@end
