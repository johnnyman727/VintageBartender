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
#import "VintageBartenderSecondViewController.h"

@implementation PurchaseDataController

@synthesize purchaseList = _purchaseList, vbs=_vbs;

- (id)init {
    if (self = [super init]) {
        return self;
    }
    return nil;
}

- (NSUInteger)countOfPurchaseList {
    return [self.purchaseList count];
}

- (Purchase *)objectInPurchaseListAtIndex:(NSUInteger)index {
    return [self.purchaseList objectAtIndex:index];
}

- (void)addPurchase:(Purchase *)newPurchase {
    
    [[RKObjectManager sharedManager] postObject:newPurchase delegate: self];
}

- (void)addPurchaseListObjectWithDrinks:(NSString *)drinks by:(NSInteger )barflyIdNum cost:(float)cost {

    Purchase *purchase = [[Purchase alloc] initWithDrinks:drinks by:barflyIdNum cost:cost];
    
    [self addPurchase:purchase];
}

- (void)requestPurchaseListFromServer {
    
    [[RKObjectManager sharedManager] loadObjectsAtResourcePath:@"/purchases" delegate:self];
}

- (void)objectLoader:(RKObjectLoader*)objectLoader didLoadObjects:(NSArray*)objects {
    
    //RKLogInfo(@"Load collection of Purchases: %@", objects);
    
    self.purchaseList = objects;
    
    if (self.vbs != nil) {
        [self.vbs transactionsLoaded:objects];
    }
}

- (void)objectLoader:(RKObjectLoader *)objectLoader didFailWithError:(NSError *)error {
    
    RKLogInfo(@"Load collection of Purchases FAILED: %@", error);
}

@end
