//
//  findTheMistakeVC.m
//  Spendiza
//
//  Created by Prateek Kukreja on 4/27/13.
//  Copyright (c) 2013 Prateek Kukreja. All rights reserved.
//

#import "findTheMistakeVC.h"
#import "Image.h"
#import "AppDelegate.h"

@interface findTheMistakeVC ()

@end

@implementation findTheMistakeVC
NSArray *images;
int currImg = 0; 

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadTableData];
    [self loadImage];
   // self.mistakeImageView.image =
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (AppDelegate *)appDelegate {
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}
- (void) loadTableData {
    
    NSManagedObjectContext *context = [[self appDelegate] managedObjectContext];
    
    // Construct a fetch request
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Image"inManagedObjectContext:context];
    
    [fetchRequest setEntity:entity];
    
    NSError *error = nil;
    images = [context executeFetchRequest:fetchRequest error:&error];
    [self.view reloadInputViews];
}
-(void)loadImage
{
    Image *i;
    i = [images objectAtIndex:currImg];
    NSLog(@"%@ name ", i.file);
    self.mistakeImageView.image = [UIImage imageNamed:i.file];
    [self.view reloadInputViews];
   // [self.mistakeImageView reloadData];
}

- (IBAction)noButton:(id)sender {
    Image *i;
    i = [images objectAtIndex:currImg];
    NSLog(@"Hit%i", i.right.intValue);
    if ([i.right compare:[NSNumber numberWithBool:NO]] == NSOrderedSame) {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: @"Correct!"
                              message: @"This is something you should be concerned about."
                              delegate: nil
                              cancelButtonTitle:@"Next Picture"
                              otherButtonTitles:nil];
        [alert show];
        currImg++;
        if(currImg >= [images count])
            currImg = 0;
        [self loadImage];
        
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: @"Incorrect"
                              message: @"Sorry, Please try again"
                              delegate: nil
                              cancelButtonTitle:@"Try Again"
                              otherButtonTitles:nil];
        [alert show];
    }
}

- (IBAction)yesButton:(id)sender {
    Image *i;
    i = [images objectAtIndex:currImg];
    NSLog(@"Hit2 %i", i.right.intValue);
    if ([i.right compare:[NSNumber numberWithBool:YES]] == NSOrderedSame) {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: @"Correct!"
                              message: @"This is safe!"
                              delegate: nil
                              cancelButtonTitle:@"Next Picture"
                              otherButtonTitles:nil];
        [alert show];
        currImg++;
        if(currImg >= [images count])
            currImg = 0;
        [self loadImage];
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: @"Incorrect"
                              message: @"Sorry, Please try again"
                              delegate: nil
                              cancelButtonTitle:@"Try Again"
                              otherButtonTitles:nil];
        [alert show];
    }
}
@end
