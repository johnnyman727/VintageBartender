//
//  NetworkDataController.h
//  Vintage Bartender-Mobile
//
//  Created by Jon McKay on 3/28/12.
//  Copyright (c) 2012 Olin College of Engineering. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RestKit/RestKit.h"

@interface NetworkDataController : NSObject

+(void)initNetworkListening;

+(void)testConnection;

+(void)objectLoader:(RKObjectLoader*)objectLoader didLoadObjects:(NSArray*)objects; 

+(void)objectLoader:(RKObjectLoader*)objectLoader didFailWithError:(NSError*)error;

@end
