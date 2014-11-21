//
//  GlanceController.h
//  MyApp
//
//  Created by llv23 on 11/21/14.
//  Copyright (c) 2014 llv23. All rights reserved.
//

#import <WatchKit/WatchKit.h>

@interface GlanceController : WKInterfaceController

@property (weak, nonatomic) IBOutlet WKInterfaceLabel* cityLabel;
@property (weak, nonatomic) IBOutlet WKInterfaceMap* cityMap;

@end
