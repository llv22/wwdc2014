//
//  ViewController.m
//  228_PresetationController
//
//  Created by llv22 on 6/28/14.
//  Copyright (c) 2014 llv22. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"

@interface ViewController ()
            

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)popupForPeople:(id)sender{
    // see http://stackoverflow.com/questions/20490809/instantiating-uitableviewcontroller-in-appdelegate-to-work-with-storyboard-ios
    UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    TableViewController* contentController = (TableViewController*)[storyboard instantiateInitialViewController];
    contentController.modalPresentationStyle = UIModalPresentationPopover;
    
    UIPopoverPresentationController *popPC = contentController.popoverPresentationController;
//    popPC.barButtonItem = item;
    popPC.permittedArrowDirections = UIPopoverArrowDirectionAny;
    popPC.delegate = self;
    [self presentViewController:contentController animated:YES completion:nil];
}

@end
