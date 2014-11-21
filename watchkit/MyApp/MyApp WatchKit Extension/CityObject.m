//
//  CityObject.m
//  MyApp
//
//  Created by llv23 on 11/21/14.
//  Copyright (c) 2014 llv23. All rights reserved.
//

#import "CityObject.h"

@implementation CityObject

- (id) initWithName:(NSString*)name Loc:(CLLocationCoordinate2D)loc {
    self = [super init];
    if (self) {
        self.cityName = name;
        self.cityLocation = loc;
    }
    return self;
}

@end
