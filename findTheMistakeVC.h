//
//  findTheMistakeVC.h
//  Spendiza
//
//  Created by Prateek Kukreja on 4/27/13.
//  Copyright (c) 2013 Prateek Kukreja. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface findTheMistakeVC : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *mistakeImageView;
- (IBAction)noButton:(id)sender;
- (IBAction)yesButton:(id)sender;

@end
