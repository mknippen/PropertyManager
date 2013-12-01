//
//  ObjectViewController.m
//  Property Manager
//
//  Created by Matthew Knippen on 11/20/13.
//  Copyright (c) 2013 Zwiffer Inc. All rights reserved.
//

#import "ObjectViewController.h"
#import "Building.h"
#import "Tenant.h"
#import "Unit.h"
#import <QuickDialog/QuickDialog.h>
#import "ObjectDialogViewController.h"
#import <Parse/PFQueryTableViewController.h>

@interface ObjectViewController ()

@end

@implementation ObjectViewController

+ (ObjectViewController *)newFromStoryboard {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName: @"Main_iPad" bundle:nil];
    return [storyboard instantiateViewControllerWithIdentifier: @"ObjectViewController"];
}

- (NSString *)objectType {
    if (!_objectType) {
        _objectType = @"Building"; //default
    }
    return _objectType;
}

- (void)viewDidLoad {
    self.parseClassName = self.objectType;
    self.title = [NSString stringWithFormat:@"%@s", self.objectType];
    self.textKey = @"name";
    self.pullToRefreshEnabled = YES;
    [super viewDidLoad];
}

- (PFQuery *)queryForTable {
    PFQuery *query = [super queryForTable];
    if ([self.objectType isEqualToString:@"Unit"]) {
        [query orderByAscending:@"sort"];
        [query whereKey:@"building" equalTo:self.parentObject];
    }

    return query;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addButtonPressed)];
    self.navigationItem.rightBarButtonItem = addButton;
}

- (void)addButtonPressed {

    UINavigationController *navController = self.splitViewController.viewControllers[1];
    Class objectClass = NSClassFromString(self.objectType);
    ObjectDialogViewController *dialogVC = [[ObjectDialogViewController alloc] initWithRoot:[objectClass rootElement]];
    dialogVC.parentObject = self.parentObject;
    dialogVC.objectType = self.objectType;
    [navController pushViewController:dialogVC animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - PFQueryTableViewController

- (void)objectsWillLoad {
    [super objectsWillLoad];

    // This method is called before a PFQuery is fired to get more objects
}

- (void)objectsDidLoad:(NSError *)error {
    [super objectsDidLoad:error];

    // This method is called every time objects are loaded from Parse via the PFQuery
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    ObjectViewController *objectVC = [ObjectViewController newFromStoryboard];
    objectVC.parentObject = self.objects[indexPath.row];
    objectVC.objectType = @"Unit";
    [self.navigationController pushViewController:objectVC animated:YES];
}


- (PFTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object {
    static NSString *identifier = @"Cell";
    PFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[PFTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    cell.textLabel.text = object[@"name"];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    if ([self.objectType isEqualToString:@"Building"]) {
        Building *b = (Building *)object;

        if (b.unitCount <=1) {
            cell.detailTextLabel.text = [NSString stringWithFormat:@"1 Unit"];
        } else {
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%i Units", b.unitCount];
        }
    } else {
        cell.detailTextLabel.text = @"";

    }

    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end
