//
//  BarflyDataController.m
//  Vintage Bartender-Mobile
//
//  Created by Jon McKay on 3/28/12.
//  Copyright (c) 2012 Olin College of Engineering. All rights reserved.
//

#import "BarflyDataController.h"
#import "Barfly.h"

@interface BarflyDataController ()
-(void) sendBarflyToServer:(Barfly *)newBarfly; 
@end

@implementation BarflyDataController

@synthesize barflyList=_barflyList;

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

-(void)addBarflyWithName:(NSString *)name email:(NSString *)email {
    Barfly *barfly;

    barfly = [[Barfly alloc] initWithName:name email:email];

    [self sendBarflyToServer:barfly];
}

-(void)requestBarflyListFromServer {    
    [[RKObjectManager sharedManager] loadObjectsAtResourcePath:@"/people" delegate:self];
}

-(void)sendBarflyToServer:(Barfly *)newBarfly {
   [[RKObjectManager sharedManager] postObject:newBarfly delegate:self]; 
}

- (void)objectLoader:(RKObjectLoader*)objectLoader didLoadObjects:(NSArray*)objects {
    RKLogInfo(@"Load collection of Barflys: %@", objects);
    
    // Add the objects to the instance variable for later usage
    self.barflyList = objects;
}

- (void)objectLoader:(RKObjectLoader *)objectLoader didFailWithError:(NSError *)error {
    RKLogInfo(@"Load collection of Barflys FAILED: %@", error);
}



@end
