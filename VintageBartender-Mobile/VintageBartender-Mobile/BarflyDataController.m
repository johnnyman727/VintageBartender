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
   
}



- (void)objectLoader:(RKObjectLoader*)objectLoader didLoadObjects:(NSArray*)objects {
    RKLogInfo(@"Load collection of Barflys: %@", objects);
    
    self.barflyList = objects;
}

- (void)objectLoader:(RKObjectLoader *)objectLoader didFailWithError:(NSError *)error {
    RKLogInfo(@"Did not load collection of Barflys: %@", error);
}


@end
