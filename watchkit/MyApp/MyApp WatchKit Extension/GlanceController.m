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

/**
 see reference in https://stackoverflow.com/questions/27796088/no-visible-interface-for-wkinterfacecontroller-declares-the-selector-initwit
 */
- (void)awakeWithContext:(id)context {
    // Configure interface objects here. Apple watch API changed, as loading context directly
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
    [self.cityMap setRegion:region];
}

@end
