//
//  AppDelegate.m
//  youWealkling
//
//  Created by fredhedz on 8/29/14.
//  Copyright (c) 2014 Freddy Hernandez Jr. All rights reserved.
//

#import "AppDelegate.h"
#import "JokeViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    if ([UIApplication instancesRespondToSelector:@selector(registerUserNotificationSettings:)]) {
        [application registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|UIUserNotificationTypeSound categories:nil]];
    }

    UIPageControl *pageControl = [UIPageControl appearance];
    pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
    pageControl.backgroundColor = [UIColor whiteColor];

    UILocalNotification *localNotification = [launchOptions objectForKey:UIApplicationLaunchOptionsLocalNotificationKey];
    if (localNotification) {
        [self presentJoke:localNotification.alertBody];
        //present the alertbody in subview of the rootview localNotification.alertBody
    }
//    [[UserOptions new] check];
    return YES;
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    [self presentJoke:notification.alertBody];
    //present the alertbody in subview of rootview localNotification.alertBody
    
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    NSLog(@"Will resign active");
    /*
    UserOptions *userOptions = [UserOptions new];
    QuotesManager *quotesManager = [QuotesManager new];
    
    if (userOptions.notificationsEnabled && (userOptions.categoryIsSelected)) {
        for (int i = 0; i < 65; i++) {
            UILocalNotification *localNotification = [UILocalNotification new];
            localNotification.alertBody = [quotesManager quoteForDiet:userOptions.diet exercise:userOptions.exercise creativity:userOptions.creativity life:userOptions.life love:userOptions.love study:userOptions.study];
            localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:userOptions.notificationTimeInterval*(i+1)];
            NSLog(@"%@", localNotification.fireDate);
            [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
        }
    }*/
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    NSLog(@"Did enter background.");
    UserOptions *userOptions = [UserOptions new];
    QuotesManager *quotesManager = [QuotesManager new];
    
    if (userOptions.notificationsEnabled && (userOptions.categoryIsSelected)) {
        for (int i = 0; i < 65; i++) {
            UILocalNotification *localNotification = [UILocalNotification new];
            localNotification.alertBody = [quotesManager quoteForDiet:userOptions.diet exercise:userOptions.exercise creativity:userOptions.creativity life:userOptions.life love:userOptions.love study:userOptions.study];
            localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:userOptions.notificationTimeInterval*(i+1)];
            NSLog(@"%@", localNotification.fireDate);
            [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
        }
    }

    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    NSLog(@"Will enter foreground. Cancelling all notifications...");
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    NSLog(@"Did become active.");
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void) presentJoke:(NSString *)jokeString{
    NSLog(@"Presenting Joke");
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *mainViewController = [self.window rootViewController];
    JokeViewController *jokeViewController = [mainStoryboard instantiateViewControllerWithIdentifier:@"JokeViewController"];
    jokeViewController.joke = jokeString;
    
    [mainViewController addChildViewController:jokeViewController];
    [mainViewController.view addSubview:jokeViewController.view];
    [mainViewController didMoveToParentViewController:jokeViewController];
}
@end
