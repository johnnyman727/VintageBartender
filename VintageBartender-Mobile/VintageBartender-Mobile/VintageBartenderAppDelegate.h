//
//  VintageBartenderAppDelegate.h
//  VintageBartender-Mobile
//
//  Created by Jon McKay on 4/1/12.
//  Copyright (c) 2012 Olin College of Engineering. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RestKit/RestKit.h"

@class BarflyDataController;
@class PurchaseDataController;

@interface VintageBartenderAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (retain, nonatomic) BarflyDataController *barflyDataController;

@property (retain, nonatomic) PurchaseDataController *purchaseDataController;

@end
