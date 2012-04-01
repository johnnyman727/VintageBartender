//
//  NetworkDataController.h
//  Vintage Bartender-Mobile
//
//  Created by Jon McKay on 3/28/12.
//  Copyright (c) 2012 Olin College of Engineering. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NetworkDataController : NSObject

+(void)initNetworkListening;

+(void)sendDataToServerFromJSON:(NSString *)jsonData;

+(void)testConnection;

@end
