//
//  FaqTVC.m
//  Spendiza
//
//  Created by Robert Lavoie on 4/28/13.
//  Copyright (c) 2013 Prateek Kukreja. All rights reserved.
//

#import "FaqTVC.h"
#import "AppDelegate.h"
#import "Faq.h"

@interface FaqTVC ()

@end

@implementation FaqTVC
NSArray * faqs;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadTableData];
    Faq *temp = [faqs objectAtIndex:0];
    self.cell1.textLabel.text = temp.faqLabel;
    temp = [faqs objectAtIndex:1];
    self.cell2.textLabel.text = temp.faqLabel;
    temp = [faqs objectAtIndex:2];
    self.cell3.textLabel.text = temp.faqLabel;
    temp = [faqs objectAtIndex:3];
    self.cell4.textLabel.text = temp.faqLabel;
    
    [self.tableView reloadData];

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

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

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
 
    selectedFaq = [faqs objectAtIndex:[indexPath section]];
    [self performSegueWithIdentifier:@"sequeToDetails" sender:self];
    
}
- (AppDelegate *)appDelegate {
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}
- (void) loadTableData {
    
    NSManagedObjectContext *context = [[self appDelegate] managedObjectContext];
    
    // Construct a fetch request
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Faq"inManagedObjectContext:context];
    
    [fetchRequest setEntity:entity];
    
    NSError *error = nil;
    faqs = [context executeFetchRequest:fetchRequest error:&error];
    [self.view reloadInputViews];
}
+(Faq * )getSelected
{
    return selectedFaq;
}

@end
