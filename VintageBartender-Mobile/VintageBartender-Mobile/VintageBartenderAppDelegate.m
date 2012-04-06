//
//  VintageBartenderAppDelegate.m
//  VintageBartender-Mobile
//
//  Created by Jon McKay on 4/1/12.
//  Copyright (c) 2012 Olin College of Engineering. All rights reserved.
//

#import "VintageBartenderAppDelegate.h"
#import "RestKit/RestKit.h"
#import "Barfly.h"
#import "BarflyDataController.h"
#import "Purchase.h"
#import "PurchaseDataController.h"
#import "Payment.h"
#import "PaymentDataController.h"

@implementation VintageBartenderAppDelegate

@synthesize window = _window, barflyDataController = _barflyDataController, purchaseDataController = _purchaseDataController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch
    [self setMappings];
    
    self.barflyDataController = [[BarflyDataController alloc] init];
    
    self.purchaseDataController = [[PurchaseDataController alloc] init];
    
    [self.purchaseDataController requestPurchaseListFromServer];
    
    return YES;
} 

-(void) setMappings {
    // Base URLS
    [RKClient clientWithBaseURL:[NSURL URLWithString:@"http://vintagebartender.heroku.com"]];
    [RKObjectManager managerWithBaseURL:[NSURL URLWithString:@"http://vintagebartender.heroku.com"]];
    [RKObjectManager sharedManager].serializationMIMEType = RKMIMETypeJSON;
    
    //******* Barfly Mappings **************    
    RKObjectMapping* barflyMapping = [RKObjectMapping mappingForClass:[Barfly class]];
    [barflyMapping mapKeyPath:@"id" toAttribute:@"idNum"];
    [barflyMapping mapKeyPath:@"name" toAttribute:@"name"];
    [barflyMapping mapKeyPath:@"email" toAttribute:@"email"];
    [barflyMapping mapKeyPath:@"created_at" toAttribute:@"createdAt"];
    [barflyMapping mapKeyPath:@"amt_owed" toAttribute:@"amountOwed"];
    [barflyMapping mapKeyPath:@"updated_at" toAttribute:@"updatedAt"];    
    [[RKObjectManager sharedManager].mappingProvider setMapping:barflyMapping forKeyPath:@"people"];
    
    // Configure a serialization mapping for our Barfly class
    RKObjectMapping* barflySerializationMapping = [RKObjectMapping mappingForClass:[NSMutableDictionary class]];
    [barflySerializationMapping mapAttributes:@"name", @"email", nil];
    
    // Now register the mapping with the provider
    [[RKObjectManager sharedManager].mappingProvider setSerializationMapping:barflySerializationMapping forClass:[Barfly class]];
    
    // Set up the routing for Barfly POSTS
    RKObjectRouter *router = [[RKObjectManager sharedManager] router];
    [router routeClass:[Barfly class] toResourcePath:@"/people" forMethod:RKRequestMethodPOST];
    
    
    // Purchase Mappings
    RKObjectMapping *purchaseMapping = [RKObjectMapping mappingForClass:[Purchase class]];
    [purchaseMapping mapKeyPath:@"id" toAttribute:@"idNum"];
    [purchaseMapping mapKeyPath:@"created_at" toAttribute:@"createdAt"];
    [purchaseMapping mapKeyPath:@"id" toAttribute:@"barflyIdNum"];
    [purchaseMapping mapKeyPath:@"drinks" toAttribute:@"drinks"];
    [purchaseMapping mapKeyPath:@"notes" toAttribute:@"notes"];
    [[RKObjectManager sharedManager].mappingProvider setMapping:purchaseMapping forKeyPath:@"purchases"];   
    
    
    //NSDictionary* params = [NSDictionary dictionaryWithObject:@"George Foreskin" forKey:@"person[name]"];  
    //[[RKClient sharedClient] post:@"/people.json" params:params delegate:self];
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
