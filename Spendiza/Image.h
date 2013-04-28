//
//  Image.h
//  Spendiza
//
//  Created by Robert Lavoie on 4/28/13.
//  Copyright (c) 2013 Prateek Kukreja. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Image : NSManagedObject

@property (nonatomic, retain) NSString * file;
@property (nonatomic, retain) NSNumber * right;

@end
