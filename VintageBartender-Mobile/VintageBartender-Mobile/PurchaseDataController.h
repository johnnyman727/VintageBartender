//
//  PurchaseDataController.h
//  Vintage Bartender-Mobile
//
//  Created by Jon McKay on 3/28/12.
//  Copyright (c) 2012 Olin College of Engineering. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RestKit/RestKit.h"

@class Purchase;
@class Barfly;

@interface PurchaseDataController : NSObject <RKObjectLoaderDelegate, RKRequestDelegate>

@property (nonatomic, copy) NSArray *purchaseList;

- (NSUInteger)countOfPurchaseList;

- (Purchase *)objectInPurchaseListAtIndex:(NSUInteger)index;

-(void)addPurchaseListObjectWithId:(NSInteger)idNum barfly:(Barfly *)barfly drinks:(NSString *)drinks cost:(NSInteger)cost notes:(NSString *)notes;

- (void)requestPurchaseListFromServer;

@end
