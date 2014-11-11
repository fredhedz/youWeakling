//
//  ViewController.h
//  youWealkling
//
//  Created by fredhedz on 8/29/14.
//  Copyright (c) 2014 Freddy Hernandez Jr. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserOptions.h"
#import "QuotesManager.h"



@interface ViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate, UIPickerViewDataSource, UIPickerViewDelegate, UIPageViewControllerDataSource>

@property (strong, nonatomic) UIPageViewController *pageViewController;

@end
