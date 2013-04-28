//
//  Image.h
//  Spendiza
//
//  Created by Robert Lavoie on 4/27/13.
//  Copyright (c) 2013 Prateek Kukreja. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Image : NSManagedObject

@property (nonatomic, retain) NSNumber * x;
@property (nonatomic, retain) NSNumber * y;
@property (nonatomic, retain) NSNumber * height;
@property (nonatomic, retain) NSNumber * length;
@property (nonatomic, retain) NSString * file;
@property (nonatomic, retain) NSNumber * id;

@end
