//
//  Trivia.h
//  Spendiza
//
//  Created by Robert Lavoie on 4/27/13.
//  Copyright (c) 2013 Prateek Kukreja. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Trivia : NSManagedObject

@property (nonatomic, retain) NSString * question;
@property (nonatomic, retain) NSNumber * correct;
@property (nonatomic, retain) NSString * first;
@property (nonatomic, retain) NSString * fourth;
@property (nonatomic, retain) NSString * third;
@property (nonatomic, retain) NSString * second;
@property (nonatomic, retain) NSString * expl;
@property (nonatomic, retain) NSNumber * id;

@end
