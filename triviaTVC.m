//
//  triviaTVC.m
//  Spendiza
//
//  Created by Prateek Kukreja on 4/27/13.
//  Copyright (c) 2013 Prateek Kukreja. All rights reserved.
//

#import "triviaTVC.h"
#import "AppDelegate.h"
#import "Trivia.h"

@interface triviaTVC ()

@end

@implementation triviaTVC

NSArray *questions;
int quest = 0;



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
    [self loadTrivia];

    

    

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

#pragma mark - Table view data source




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
    int clicked = indexPath.row;
    Trivia *t;
    t = [questions objectAtIndex:quest];
    if (clicked != t.correct.intValue)
    {
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle: @"Sorry that is wrong"
                          message: @"Please try again,"
                          delegate: nil
                          cancelButtonTitle:@"Try Again"
                          otherButtonTitles:nil];
    [alert show];
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: @"Correct!"
                              message: t.expl
                              delegate: nil
                              cancelButtonTitle:@"Next Question"
                              otherButtonTitles:nil];
        [alert show];
    quest++;
    if (quest >= [questions count])
        quest =0;
    [self loadTrivia];
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    }
}
- (AppDelegate *)appDelegate {
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}


- (void) loadTableData {
    
    NSManagedObjectContext *context = [[self appDelegate] managedObjectContext];
    
    // Construct a fetch request
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Trivia"inManagedObjectContext:context];
    
    [fetchRequest setEntity:entity];
    
    NSError *error = nil;
    questions = [context executeFetchRequest:fetchRequest error:&error];
    [self.tableView reloadData];
}

-(void)loadTrivia
{
    Trivia *t;
    t = [questions objectAtIndex:quest];
    self.question.textLabel.numberOfLines = 0;
    self.answer1.textLabel.numberOfLines = 0;
    self.answer2.textLabel.numberOfLines = 0;
    self.answer3.textLabel.numberOfLines = 0;
    self.answer4.textLabel.numberOfLines = 0;
    self.question.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.answer1.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.answer2.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.answer3.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.answer4.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    self.question.textLabel.text = t.question;
    self.answer1.textLabel.text = t.first;
    self.answer2.textLabel.text = t.second;
    self.answer3.textLabel.text = t.third;
    self.answer4.textLabel.text = t.fourth;
    [self.tableView reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0 && [indexPath section]==0) // for cell with dynamic height
    {
        return 100;
    }
    else
    {
        // return height from the storyboard
        return 44;
    }
}
- (IBAction)Pass:(id)sender {
    quest++;
    if (quest >= [questions count])
        quest =0;
    [self loadTrivia];
    
}
@end
