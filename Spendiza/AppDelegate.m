//
//  AppDelegate.m
//  Spendiza
//
//  Created by Prateek Kukreja on 4/27/13.
//  Copyright (c) 2013 Prateek Kukreja. All rights reserved.
//

#import "AppDelegate.h"
#import "Facts.h"
#import "Image.h"
#import "Trivia.h"
#import "Faq.h"
@implementation AppDelegate

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
   // if ([self managedObjectContext] == nil)
   // [self create];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
             // Replace this implementation with code to handle the error appropriately.
             // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        } 
    }
}

#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Spendiza" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Spendiza.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
         @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES}
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }    
    
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

-(void)create
{
    //Grab the Context
    NSManagedObjectContext *context = [self managedObjectContext];
    
    //Facts Entity
    Facts *facts = [NSEntityDescription insertNewObjectForEntityForName:@"Facts" inManagedObjectContext:context];
    facts.info = @"Personal information can be an open invitation for scam artists to target your payment acounts. This includes sharing pictures that expose your information,like tweeting a picture of your credit card or billing information.";
    Facts *facts2 = [NSEntityDescription insertNewObjectForEntityForName:@"Facts" inManagedObjectContext:context];
    facts2.info = @"Only sites that start with https protect your personal data. Some browers use other clues like a padlock next to the address. You should only shop at sites that are identified as secure.";
    Facts *facts3 = [NSEntityDescription insertNewObjectForEntityForName:@"Facts" inManagedObjectContext:context];
    facts3.info = @"If a thief obtains your drivers license they can pretend to be you and potentially open bank accounts, credit cards, and obtain loans. This can make it difficult to obtain credit in the future. Prevent dumpster diving by destroying personal information.";
    
    Trivia *trivia1 = [NSEntityDescription insertNewObjectForEntityForName:@"Trivia" inManagedObjectContext:context];
    trivia1.question = @"Which of the following is a good way to prevent yourself from becoming a victim of financial fraud?";
    trivia1.first = @"Post a picture of your credit card on facebook";
    trivia1.second = @"Brag about your new high limit Visa card";
    trivia1.third = @"Monitor your financial statements online on a regular basis";
    trivia1.fourth = @"Shop using nonsecure websites";
    NSNumber *ans = [[NSNumber alloc]initWithInt:2];
    trivia1.correct = ans;
    trivia1.expl = @"Regularly Monitoring you financial statements online will prevent you from being a victim of id fraud.";
    
    
    Trivia *trivia2 = [NSEntityDescription insertNewObjectForEntityForName:@"Trivia" inManagedObjectContext:context];
    trivia2.question = @"Which of the following will criminals attempt to do to get valuable infomation?";
    trivia2.first = @"Impersonate legitamate organizations";
    trivia2.second = @"Install malware on consumers' devices";
    trivia2.third = @"Use text messages to solicit information from consumers";
    trivia2.fourth = @"All of the above";
    NSNumber *ans2 = [[NSNumber alloc]initWithInt:3];
    trivia2.correct = ans2;
    trivia2.expl = @"Criminals will try all of the above along with many other things to get your information. We always need to be careful!";
    
    Trivia *trivia3 = [NSEntityDescription insertNewObjectForEntityForName:@"Trivia" inManagedObjectContext:context];
    trivia3.question = @"Which of the following is not something you can do to prevent id theft?";
    trivia3.first = @"Sign Credit Cards upon Receipt";
    trivia3.second = @"Cancel inactive accounts";
    trivia3.third = @"Let me borrow your credit card";
    trivia3.fourth = @"Change Passwords Regularly";
    NSNumber *ans3 = [[NSNumber alloc]initWithInt:3];
    trivia3.correct = ans3;
    trivia3.expl = @"Changing passwords, particularly for banking and other financial sites will help protect you from fraud.";
    
    //Image Entity
    Image *image = [NSEntityDescription insertNewObjectForEntityForName:@"Image" inManagedObjectContext:context];
    //Image Entity
    Image *image2 = [NSEntityDescription insertNewObjectForEntityForName:@"Image" inManagedObjectContext:context];
    Image *image3 = [NSEntityDescription insertNewObjectForEntityForName:@"Image" inManagedObjectContext:context];
    
    image.file = @"image01.png";
    image.right = [NSNumber numberWithBool:NO];
    image2.file = @"image02.png";
    image2.right = [NSNumber numberWithBool:NO];
    image3.file = @"image03.png";
    image3.right = [NSNumber numberWithBool:YES];
    
    Faq *faq1 = [NSEntityDescription insertNewObjectForEntityForName:@"Faq" inManagedObjectContext:context];
    Faq *faq2 = [NSEntityDescription insertNewObjectForEntityForName:@"Faq" inManagedObjectContext:context];
    Faq *faq3 = [NSEntityDescription insertNewObjectForEntityForName:@"Faq" inManagedObjectContext:context];
    Faq *faq4 = [NSEntityDescription insertNewObjectForEntityForName:@"Faq" inManagedObjectContext:context];
    
    
    faq1.faqLabel = @"I Lost my card";
    faq1.faqDescript = @"Contact Visa NOW! Although you have Zero Liability, it will make everything easier if you contact us right away. See http://usa.visa.com/personal/security/get-help-now.html";
    faq2.faqLabel = @"I think my ID is compromised";
    faq2.faqDescript = @"You should take action now! The government and Visa both offer many options as to what you may do. You should ask for information regarding your credit scores to verify that they are correct. If you suspect tax fraud you should contact the IRS by completing and IRS Identity Theft Affidavit";
    faq3.faqLabel = @"Phishing Information";
    faq3.faqDescript = @"Phishing can take place through text, email, phone, and websites. If you have questions there are many resourses online including http://www.fbi.gov/scams-safety/ and www.staysafeonline.org.";
    faq4.faqLabel = @"More information";
    faq4.faqDescript = @"Please see the resources on Visa's website, starting with www.visasecuritysense,com. ";
    // Save everything
    NSError *error = nil;
    if ([context save:&error]) {
        NSLog(@"The save was successful!");
    } else {
        NSLog(@"The save wasn't successful: %@", [error userInfo]);
    }
    
                    
}



@end
