//
//  PurchaseDataController.m
//  Vintage Bartender-Mobile
//
//  Created by Jon McKay on 3/28/12.
//  Copyright (c) 2012 Olin College of Engineering. All rights reserved.
//

#import "PurchaseDataController.h"
#import "Purchase.h"
#import "Barfly.h"
#import "RestKit/RestKit.h"

@interface PurchaseDataController ()
-(void) sendPurchaseToServer:(Purchase *)newPurchase; 
@end

@implementation PurchaseDataController

@synthesize purchaseList = _purchaseList;

-(id)init {
    if (self = [super init]) {
        return self;
    }
    return nil;
}

-(NSUInteger)countOfPurchaseList {
    return [self.purchaseList count];
}

-(Purchase *)objectInPurchaseListAtIndex:(NSUInteger)index {
    return [self.purchaseList objectAtIndex:index];
}

-(void)addPurchaseListObjectWithId:(NSInteger)idNum barfly:(Barfly *)barfly drinks:(NSString *)drinks cost:(NSInteger)cost notes:(NSString *)notes{

    Purchase *purchase = [[Purchase alloc] initWithId:idNum by:barfly.idNum purchased:drinks cost:cost notes:notes];
    
    [self sendPurchaseToServer:purchase];
}

-(void)requestPurchaseListFromServer {
    [[RKObjectManager sharedManager] loadObjectsAtResourcePath:@"/purchases" delegate:self];
}

-(void)sendPurchaseToServer:(Purchase *)newPurchase {
    [[RKObjectManager sharedManager] postObject:newPurchase delegate: self];
   
}

- (void)objectLoader:(RKObjectLoader*)objectLoader didLoadObjects:(NSArray*)objects {
    RKLogInfo(@"Load collection of Purchases: %@", objects);
    
    self.purchaseList = objects;
}

- (void)objectLoader:(RKObjectLoader *)objectLoader didFailWithError:(NSError *)error {
    RKLogInfo(@"Load collection of Purchases FAILED: %@", error);
}

@end
