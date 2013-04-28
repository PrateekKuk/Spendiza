//
//  triviaTVC.h
//  Spendiza
//
//  Created by Prateek Kukreja on 4/27/13.
//  Copyright (c) 2013 Prateek Kukreja. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface triviaTVC : UITableViewController
@property (strong, nonatomic) IBOutlet UITableView *triviaTable;
@property (strong, nonatomic) IBOutlet UITableViewCell *question;
@property (strong, nonatomic) IBOutlet UITableViewCell *answer1;
@property (strong, nonatomic) IBOutlet UITableViewCell *answer2;
@property (strong, nonatomic) IBOutlet UITableViewCell *answer3;
@property (strong, nonatomic) IBOutlet UITableViewCell *answer4;

- (IBAction)Pass:(id)sender;


@end
