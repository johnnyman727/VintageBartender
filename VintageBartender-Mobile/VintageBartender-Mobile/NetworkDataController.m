//
//  NetworkDataController.m
//  Vintage Bartender-Mobile
//
//  Created by Jon McKay on 3/28/12.
//  Copyright (c) 2012 Olin College of Engineering. All rights reserved.
//

#import "NetworkDataController.h"
#import "RestKit/RestKit.h"
#import "Barfly.h"
#import "VintageBartenderAppDelegate.h"

@interface NetworkDataController()
+(void)request:(RKRequest *)request didLoadResponse:(RKResponse *)response;
@end


@implementation NetworkDataController 

+(void)initNetworkListening {
    // Set up RKClient and point to server root
    //[RKClient clientWithBaseURL:[NSURL URLWithString:@"http://vintagebartender.heroku.com"]];
        
    // Debug
    //NSLog(@"Connected to RKClient : %@", [RKClient sharedClient]);
    
}

+(void)request:(RKRequest*)request didLoadResponse:(RKResponse*)response {  
    if ([request isGET]) {  
        // Handling GET /foo.xml  
        
        if ([response isOK]) {  
            // Success! Let's take a look at the data  
            NSLog(@"Retrieved XML: %@", [response bodyAsString]);  
        }  
        
    } else if ([request isPOST]) {  
        
        // Handling POST /other.json  
        if ([response isJSON]) {  
            NSLog(@"Got a JSON response back from our POST!");  
        }  
        
    } else if ([request isDELETE]) {  
        
        // Handling DELETE /missing_resource.txt  
        if ([response isNotFound]) {  
            NSLog(@"The resource path '%@' was not found.", [request resourcePath]);  
        }  
    }  
} 
+(void)testConnection {
    //[[RKClient sharedClient] get:@"/people.json" delegate:self];
    //RKObjectManager* objectManager = [RKObjectManager objectManagerWithBaseURL:[NSURL URLWithString:@"http://vintagebartender.heroku.com"]];
    //[[RKObjectManager sharedManager] loadObjectsAtResourcePath:@"/people.json" delegate:self];
    RKObjectMapping* articleMapping = [[RKObjectManager sharedManager].mappingProvider objectMappingForClass:[Barfly class]];
    [[RKObjectManager sharedManager] loadObjectsAtResourcePath:@"/people.json" objectMapping:articleMapping delegate:[VintageBartenderAppDelegate class]];

}

+(void)objectLoader:(RKObjectLoader*)objectLoader didLoadObjects:(NSArray*)objects {
    RKLogInfo(@"Load collection of Barflys: %@", objects);
}

+ (void)objectLoader:(RKObjectLoader*)objectLoader didFailWithError:(NSError*)error{
    RKLogInfo(@"Did not load collection of Barflys: %@", error);
}
@end
