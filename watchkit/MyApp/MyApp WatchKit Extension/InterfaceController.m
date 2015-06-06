//
//  InterfaceController.m
//  MyApp WatchKit Extension
//
//  Created by llv23 on 11/21/14.
//  Copyright (c) 2014 llv23. All rights reserved.
//

#import "InterfaceController.h"
#import "CityRowController.h"
#import "CityObject.h"


@interface InterfaceController()

@property (weak, nonatomic) IBOutlet WKInterfaceTable* locationTable;
@property (strong, nonatomic) NSArray* citys;

@end


@implementation InterfaceController

- (instancetype)initWithContext:(id)context {
    self = [super initWithContext:context];
    if (self){
        // Initialize variables here.
        // Configure interface objects here.
        NSLog(@"%@ initWithContext", self);
        [self loadTableData];
    }
    return self;
}

- (void)loadTableData {
    
    self.citys = @[
                       [[CityObject alloc]initWithName:@"Cupertino" Loc:CLLocationCoordinate2DMake(37.390891,-122.085282)],
                       [[CityObject alloc]initWithName:@"Sunnyvale" Loc:CLLocationCoordinate2DMake(37.373977,-122.036186)],
                       [[CityObject alloc]initWithName:@"Campbell" Loc:CLLocationCoordinate2DMake(37.288121,-121.950316)],
                       [[CityObject alloc]initWithName:@"Morgan Hill" Loc:CLLocationCoordinate2DMake(37.133498,-121.654385)],
                       [[CityObject alloc]initWithName:@"Mountain View" Loc:CLLocationCoordinate2DMake(37.390073,-122.085282)]
                       ];
    [self.locationTable setNumberOfRows:self.citys.count withRowType:@"default"];
    for (NSInteger i = 0; i < self.citys.count; i++) {
        CityRowController* row = [self.locationTable rowControllerAtIndex:i];
        CityObject* city = self.citys[i];
        [row.cityLabel setText:city.cityName];
    }
}

- (void)table:(WKInterfaceTable *)table didSelectRowAtIndex:(NSInteger)rowIndex {
    CityObject* selectedCity = self.citys[rowIndex];
    [self pushControllerWithName:@"GlanceControllerIdentifier" context:selectedCity];
}

- (void)willActivate {
    // This method is called when watch view controller is about to be visible to user
    NSLog(@"%@ will activate", self);
}

- (void)didDeactivate {
    // This method is called when watch view controller is no longer visible
    NSLog(@"%@ did deactivate", self);
}

@end



