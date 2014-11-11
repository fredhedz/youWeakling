//
//  JokeViewController.h
//  youWealkling
//
//  Created by fredhedz on 9/20/14.
//  Copyright (c) 2014 Freddy Hernandez Jr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>

@interface JokeViewController : UIViewController<ADBannerViewDelegate>

@property NSString *joke;

@end
