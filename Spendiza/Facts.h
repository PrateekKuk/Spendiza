//
//  Facts.h
//  Spendiza
//
//  Created by Robert Lavoie on 4/27/13.
//  Copyright (c) 2013 Prateek Kukreja. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Facts : NSManagedObject

@property (nonatomic, retain) NSString * info;
@property (nonatomic, retain) NSNumber * id;

@end
