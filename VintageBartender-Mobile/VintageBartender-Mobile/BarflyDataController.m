//
//  BarflyDataController.m
//  Vintage Bartender-Mobile
//
//  Created by Jon McKay on 3/28/12.
//  Copyright (c) 2012 Olin College of Engineering. All rights reserved.
//

#import "BarflyDataController.h"
#import "Barfly.h"
#import "NetworkDataController.h"

@interface BarflyDataController ()
-(void) sendBarflyToServer:(Barfly *)newBarfly; 
@end

@implementation BarflyDataController

@synthesize barflyList=_barflyList;

-(id)init {
    if (self = [super init]) {
        _barflyList = [NSMutableArray init];
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
    
    RKObjectMapping* barflyMapping = [[RKObjectManager sharedManager].mappingProvider objectMappingForClass:[Barfly class]];
    [[RKObjectManager sharedManager] loadObjectsAtResourcePath:@"/people.json" 
                                                 objectMapping:barflyMapping delegate:self];
    
}

-(void)sendBarflyToServer:(Barfly *)newBarfly {
    // Format string to send to server
    
    // Send it off to the network controller
   
}

- (void)objectLoader:(RKObjectLoader*)objectLoader didLoadObjects:(NSArray*)objects {
    RKLogInfo(@"Load collection of Barflys: %@", objects);
    self.barflyList = objects;
    for (int i = 0; i < [objects count]; i++) {
        NSLog([[objects objectAtIndex:i] name]);
    }
}


@end
