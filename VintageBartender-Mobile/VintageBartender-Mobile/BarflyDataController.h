//
//  BarflyDataController.h
//  Vintage Bartender-Mobile
//
//  Created by Jon McKay on 3/28/12.
//  Copyright (c) 2012 Olin College of Engineering. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "REstKit/RestKit.h"

@class Barfly;

@interface BarflyDataController : NSObject

@property (nonatomic, copy) NSMutableArray *barflyList;

- (NSUInteger)countOfBarflyList;
- (Barfly *)objectInBarflyListAtIndex:(NSUInteger)index;
- (void)addBarflyWithName:(NSString *)name email:(NSString *)email;
- (void)requestBarflyListFromServer;
- (void)objectLoader:(RKObjectLoader*)objectLoader didLoadObjects:(NSArray*)objects;

@end
