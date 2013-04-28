//
//  FaqTVC.h
//  Spendiza
//
//  Created by Robert Lavoie on 4/28/13.
//  Copyright (c) 2013 Prateek Kukreja. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Faq.h"
Faq *selectedFaq;
@interface FaqTVC : UITableViewController
@property (strong, nonatomic) IBOutlet UITableViewCell *cell1;
@property (strong, nonatomic) IBOutlet UITableViewCell *cell2;
@property (strong, nonatomic) IBOutlet UITableViewCell *cell4;
@property (strong, nonatomic) IBOutlet UITableViewCell *cell3;
+(Faq *)getSelected;

@end
