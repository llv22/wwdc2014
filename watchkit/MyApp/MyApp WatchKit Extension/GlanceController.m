//
//  GlanceController.m
//  MyApp
//
//  Created by llv23 on 11/21/14.
//  Copyright (c) 2014 llv23. All rights reserved.
//

#import "GlanceController.h"
#import "CityObject.h"

@implementation GlanceController

- (instancetype)initWithContext:(id)context {
    self = [super initWithContext:context];
    if (self){
        // Initialize variables here.
        // Configure interface objects here.
        NSLog(@"%@ initWithContext", self);
        CityObject* city = context;
        
        [self.cityLabel setText:city.cityName];
        //see http://www.cnblogs.com/ygm900/archive/2013/05/22/3093941.html
//        CLLocationCoordinate2D centerCoordinate = CLLocationCoordinate2DMake(39.915352,116.397105);
        //see http://tergol.blog.163.com/blog/static/17069502820108205020506/
        MKCoordinateSpan span;
        span.latitudeDelta = 0.1;
        span.longitudeDelta = 0.1;
        //see http://blog.csdn.net/tangaowen/article/details/6527901
//        MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(centerCoordinate, 1000, 1000);
        MKCoordinateRegion region = MKCoordinateRegionMake(city.cityLocation, span);
        [self.cityMap setCoordinateRegion:region];
    }
    return self;
}

@end
