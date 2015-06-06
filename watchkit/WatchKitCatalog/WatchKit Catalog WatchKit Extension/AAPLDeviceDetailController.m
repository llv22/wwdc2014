/*
 Copyright (C) 2014 Apple Inc. All Rights Reserved.
 See LICENSE.txt for this sample’s licensing information
 
 Abstract:
 
     This controller displays device specific information to use for ensuring a great experience to the wearer of the Watch app.
  
 */

#import "AAPLDeviceDetailController.h"

@interface AAPLDeviceDetailController()

@property (weak, nonatomic) IBOutlet WKInterfaceLabel *boundsLabel;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *scaleLabel;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *localeLabel;
@property (weak, nonatomic) IBOutlet WKInterfaceLabel *preferredContentSizeLabel;

@end


@implementation AAPLDeviceDetailController

- (instancetype)initWithContext:(id)context {
    self = [super initWithContext:context];

    if (self) {
        // Initialize variables here.
        // Configure interface objects here.
        
        CGRect bounds = [[WKInterfaceDevice currentDevice] screenBounds];
        CGFloat scale = [[WKInterfaceDevice currentDevice] screenScale];
        
        [self.boundsLabel setText:NSStringFromCGRect(bounds)];
        [self.scaleLabel setText:[NSString stringWithFormat:@"%f",scale]];
        [self.localeLabel setText:[[[WKInterfaceDevice currentDevice] currentLocale] localeIdentifier]];
        [self.preferredContentSizeLabel setText:[[WKInterfaceDevice currentDevice] preferredContentSizeCategory]];
    }

    return self;
}

- (void)willActivate {
    // This method is called when the controller is about to be visible to the wearer.
    NSLog(@"%@ will activate", self);
}

- (void)didDeactivate {
    // This method is called when the controller is no longer visible.
    NSLog(@"%@ did deactivate", self);
}

@end
