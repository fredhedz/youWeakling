//
//  UserOptions.m
//  YouLittleWeakling
//
//  Created by fredhedz on 7/9/14.
//  Copyright (c) 2014 Freddy Hernandez Jr. All rights reserved.
//

#import "UserOptions.h"

@implementation UserOptions

- (void)check
{
    NSInteger version = [[NSUserDefaults standardUserDefaults] integerForKey:@"version2"];
    if (version == 0) {
        [[NSUserDefaults standardUserDefaults] setInteger:1 forKey:@"version2"];
        self.diet = YES;
        self.exercise = YES;
        self.creativity = YES;
        self.life = YES;
        self.love = YES;
        self.study = YES;
        
        self.notificationTimeInterval = 30*60;
        self.notificationsEnabled = YES;
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

-(BOOL)categoryIsSelected
{
    return (self.diet || self.exercise || self.creativity || self.life || self.love || self.study);
}

- (void)setDiet:(BOOL)diet
{
    [[NSUserDefaults standardUserDefaults] setBool:diet forKey:@"diet_category"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(BOOL)diet
{
    return [[NSUserDefaults standardUserDefaults] boolForKey:@"diet_category"];
}

- (void)setCreativity:(BOOL)creativity
{
    [[NSUserDefaults standardUserDefaults] setBool:creativity forKey:@"creativity_category"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(BOOL)creativity
{
    return [[NSUserDefaults standardUserDefaults] boolForKey:@"creativity_category"];
}

- (void)setExercise:(BOOL)exercise
{
    [[NSUserDefaults standardUserDefaults] setBool:exercise forKey:@"exercise_category"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(BOOL)exercise
{
    return [[NSUserDefaults standardUserDefaults] boolForKey:@"exercise_category"];
}

- (void)setNotificationsEnabled:(BOOL)notificationsEnabled
{
    [[NSUserDefaults standardUserDefaults] setBool:notificationsEnabled forKey:@"notificationsEnabled"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)setLife:(BOOL)life
{
    [[NSUserDefaults standardUserDefaults] setBool:life forKey:@"life_category"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(BOOL)life
{
    return [[NSUserDefaults standardUserDefaults] boolForKey:@"life_category"];
}

- (void)setLove:(BOOL)love
{
    [[NSUserDefaults standardUserDefaults] setBool:love forKey:@"love_category"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(BOOL)love
{
    return [[NSUserDefaults standardUserDefaults] boolForKey:@"love_category"];
}

- (void)setStudy:(BOOL)study
{
    [[NSUserDefaults standardUserDefaults] setBool:study forKey:@"study_category"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(BOOL)study
{
    return [[NSUserDefaults standardUserDefaults] boolForKey:@"study_category"];
}

-(BOOL)notificationsEnabled
{
    return [[NSUserDefaults standardUserDefaults] boolForKey:@"notificationsEnabled"];
}

- (void)setNotificationTimeInterval:(NSTimeInterval)notificationsTimeInterval
{
    [[NSUserDefaults standardUserDefaults] setDouble:notificationsTimeInterval forKey:@"notificationsTimeInterval"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(double)notificationTimeInterval
{
    return [[NSUserDefaults standardUserDefaults] doubleForKey:@"notificationsTimeInterval"];
}

@end
