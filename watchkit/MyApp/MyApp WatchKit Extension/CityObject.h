//
//  CityObject.h
//  MyApp
//
//  Created by llv23 on 11/21/14.
//  Copyright (c) 2014 llv23. All rights reserved.
//

#import <WatchKit/WatchKit.h>

@interface CityObject : NSObject

@property (strong, nonatomic) NSString* cityName;
@property CLLocationCoordinate2D cityLocation;

-(id) initWithName:(NSString*)Name Loc:(CLLocationCoordinate2D)loc;

@end
