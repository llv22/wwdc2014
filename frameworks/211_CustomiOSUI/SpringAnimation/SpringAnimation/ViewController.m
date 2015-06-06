//
//  ViewController.m
//  SpringAnimation
//
//  Created by llv23 on 12/17/14.
//  Copyright (c) 2014 llv23. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    NSLock* session_id_lock;
    BOOL _startAnmiated;
}

@property (nonatomic, setter=SetStarted:, getter=IsStarted) BOOL startAnmiated;
@property (nonatomic, weak) IBOutlet UIView* sqaure;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint* topConstraint;

- (IBAction)startAnimation: (id)sender;
- (void)showAlert;

@end

@implementation ViewController

@synthesize startAnmiated = _startAnmiated;

- (instancetype) init {
    self =  [super init];
    if (self) {
        self->session_id_lock = [NSLock new];
        self.startAnmiated = NO;
    }
    return self;
}

- (void) SetStarted: (BOOL)started {
    if (started == self.startAnmiated) {
        return;
    }
    
    [self->session_id_lock lock];
    self->_startAnmiated = started;
    [self->session_id_lock unlock];
}

- (BOOL) IsStarted{
    return self->_startAnmiated;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    [self.view layoutIfNeeded];
    // see will call setNeedsUpdateConstraints and updateConstraintsIfNeeded accordinly
//    [self.sqaure setNeedsUpdateConstraints];
//    [self.sqaure updateConstraintsIfNeeded];
}

- (void)viewWillAppear:(BOOL)animated {
}


- (void)showAlert {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"SpringAnimation" message:@"Already started an animation, be patient for its happy ending." preferredStyle:UIAlertControllerStyleAlert];
    // Create the actions.
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        NSLog(@"The \"Okay/Cancel\" alert's cancel action occured.");
    }];
    
    UIAlertAction *otherAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSLog(@"The \"Okay/Cancel\" alert's other action occured.");
    }];
    
    // Add the actions.
    [alertController addAction:cancelAction];
    [alertController addAction:otherAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (IBAction)startAnimation: (id)sender{
    if (self.startAnmiated) {
        //se http://blog.csdn.net/yujianxiang666/article/details/35990789
        [self showAlert];
        return;
    }
    self.startAnmiated = YES;
    // see - http://stackoverflow.com/questions/12622424/how-do-i-animate-constraint-changes
    self.topConstraint.constant = self.topConstraint.constant==40 ? self.view.frame.size.height - self.sqaure.frame.size.height - 20 : 40;
    [UIView animateWithDuration:5.0f
                          delay:1.0f
         usingSpringWithDamping:3.0
          initialSpringVelocity:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         // see - http://stackoverflow.com/questions/5161096/simple-way-to-change-the-position-of-uiview
                         [self.view layoutIfNeeded];
                     }
                     completion:^(BOOL finished) {
                         //see
                         NSLog(@"Animation End");
                         self.startAnmiated = NO;
                     }
     ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
