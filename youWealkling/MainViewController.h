//
//  MainViewController.h
//  youWealkling
//
//  Created by fredhedz on 9/30/14.
//  Copyright (c) 2014 Freddy Hernandez Jr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <iAd/iAd.h>
#import "UserOptions.h"
#import "QuotesManager.h"



@interface MainViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIPickerViewDataSource, UIPickerViewDelegate, UIPageViewControllerDataSource>

@property (strong, nonatomic) UIPageViewController *pageViewController;

- (void) resetPageViewController;
- (void) exitButtonClicked;

@end