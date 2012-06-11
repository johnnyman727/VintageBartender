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
#import "Purchase.h"
#import "Payment.h"
#import "Drink.h"
#import "DrinkDataController.h"
#import "PaymentDataController.h"

@implementation VintageBartenderAppDelegate

@synthesize window = _window, ddc=_ddc;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch
    [self setRestKitMappings];
    
    self.ddc = [[DrinkDataController alloc] init];
    
    //[self.ddc requestDrinkListFromServer];
    
    return YES;
} 

-(void) setRestKitMappings {
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
    RKObjectMapping *barflySerializationMapping = [barflyMapping inverseMapping];
    
    // Now register the mapping with the provider
    [[RKObjectManager sharedManager].mappingProvider setSerializationMapping:barflySerializationMapping forClass:[Barfly class]];
    
    // Set up the routing for Barfly POSTS
    RKObjectRouter *router = [[RKObjectManager sharedManager] router];
    [router routeClass:[Barfly class] toResourcePath:@"/people" forMethod:RKRequestMethodPOST];
    
    //******* Purchase Mappings ************
    RKObjectMapping *purchaseMapping = [RKObjectMapping mappingForClass:[Purchase class]];
    [purchaseMapping mapKeyPath:@"id" toAttribute:@"idNum"];
    [purchaseMapping mapKeyPath:@"created_at" toAttribute:@"createdAt"];
    [purchaseMapping mapKeyPath:@"person_id" toAttribute:@"barflyId"];
    [purchaseMapping mapKeyPath:@"name" toAttribute:@"drinks"];
    [purchaseMapping mapKeyPath:@"notes" toAttribute:@"notes"];
    [purchaseMapping mapKeyPath:@"cost" toAttribute:@"amount"];
    [[RKObjectManager sharedManager].mappingProvider setMapping:purchaseMapping forKeyPath:@"purchases"];
    
    // Configure a serialization mapping for our Purchase class
    RKObjectMapping *purchaseSerializationMapping = [purchaseMapping inverseMapping];
    
    // Now register the mapping with the provider
    [[RKObjectManager sharedManager].mappingProvider setSerializationMapping:purchaseSerializationMapping forClass:[Purchase class]];
    
    // Set up the routing for Purchase POSTS
    [router routeClass:[Purchase class] toResourcePath:@"/purchases" forMethod:RKRequestMethodPOST];
    
    //****** Payment Mappings **************
    RKObjectMapping *paymentMapping = [RKObjectMapping mappingForClass:[Payment class]];
    [paymentMapping mapKeyPath:@"id" toAttribute:@"idNum"];
    [paymentMapping mapKeyPath:@"created_at" toAttribute:@"createdAt"];
    [paymentMapping mapKeyPath:@"person_id" toAttribute:@"barflyId"];
    [paymentMapping mapKeyPath:@"amount" toAttribute:@"amount"];
    [paymentMapping mapKeyPath:@"method" toAttribute:@"method"];
    [paymentMapping mapKeyPath:@"notes" toAttribute:@"notes"];
    [[RKObjectManager sharedManager].mappingProvider setMapping:paymentMapping forKeyPath:@"payments"];
    
    // Configure a serialization mapping for the payment class
    RKObjectMapping *paymentSerializationMapping = [paymentMapping inverseMapping];
    
    // Register the mapping with the provider
    [[RKObjectManager sharedManager].mappingProvider setSerializationMapping:paymentSerializationMapping forClass:[Payment class]];
    
    // Set up- the routing for Payment POST requests
    [router routeClass:[Payment class] toResourcePath:@"/payments" forMethod:RKRequestMethodPOST];
    
    
    //****** Drink Mappings ****************
    RKObjectMapping *drinkMapping = [RKObjectMapping mappingForClass:[Drink class]];
    [drinkMapping mapKeyPath:@"name" toAttribute:@"name"];
    [drinkMapping mapKeyPath:@"ingredients" toAttribute:@"ingredients"];
    [drinkMapping mapKeyPath:@"price" toAttribute:@"price"];
    
    // Configure a serialization mapping for the drink class
    RKObjectMapping *drinkSerializationMapping = [drinkMapping inverseMapping];
    
    // Register mapping with the provider
    [[RKObjectManager sharedManager].mappingProvider setSerializationMapping:drinkSerializationMapping forClass:[Drink class]];
    
    // Set up the routing for Drink POST requests
    [router routeClass:[Drink class] toResourcePath:@"/drinks" forMethod:RKRequestMethodPOST];
    
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
