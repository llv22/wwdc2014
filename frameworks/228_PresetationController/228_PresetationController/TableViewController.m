//
//  TableViewController.m
//  228_PresetationController
//
//  Created by llv23 on 8/26/14.
//  Copyright (c) 2014 llv22. All rights reserved.
//

#import "TableViewController.h"

// see - http://stackoverflow.com/questions/20544616/static-nsarray-of-strings-how-where-to-initialize-in-a-view-controller
@interface TableViewController (){
    NSArray* people;
}

@end

@implementation TableViewController

//- (id)init {
//    self = [super init];
//    if (self) {
//    }
//    return self;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    if(!self->people){
        self->people = @[@"Dima", @"Johannes", @"Jason", @"Gordie", @"Jacob", @"Andy", @"Nic", @"Jim", @"ShuChen", @"Toby", @"Debbie", @"Justin", @"Karl", @"Chris",  @"Marian", @"Ben", @"Colin", @"Morgan", @"Bruce", @"Sophia", @"David", @"Jordan", @"Bill", @"Ian"];
    }
//    NSIndexPath* indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//    [self.tableView selectRowAtIndexPath:indexPath animated:@NO scrollPosition:UITableViewScrollPositionNone];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self->people count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyTableViewCell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = self->people[indexPath.row];
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.title = self->people[indexPath.row];
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
