//
//  UserOptions.h
//  YouLittleWeakling
//
//  Created by fredhedz on 7/9/14.
//  Copyright (c) 2014 Freddy Hernandez Jr. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserOptions : NSObject

@property BOOL diet;
@property BOOL exercise;
@property BOOL creativity;
@property BOOL life;
@property BOOL love;
@property BOOL study;

@property BOOL notificationsEnabled;
@property NSTimeInterval notificationTimeInterval;

-(void)check;
-(BOOL)categoryIsSelected;

@end
