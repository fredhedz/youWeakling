//
//  TutorialViewController.m
//  youWealkling
//
//  Created by fredhedz on 9/1/14.
//  Copyright (c) 2014 Freddy Hernandez Jr. All rights reserved.
//

#import "TutorialViewController.h"

@interface TutorialViewController ()

@property UIPageViewController *pageViewController;

@end

@implementation TutorialViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"TutorialPageViewController"];
    self.pageViewController.dataSource = self;
    [self.pageViewController setViewControllers:@[[self tutorialContentViewControllerWithIndex:0]] direction:UIPageViewControllerNavigationDirectionForward animated:YES completion:nil];
    self.pageViewController.view.frame = CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height - 50);
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
}

#pragma - UIPageViewControllerDataSource

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger currentIndex = ((TutorialContentViewController *) viewController).pageIndex;
    if (currentIndex == 0 || currentIndex == NSNotFound) {
        return nil;
    }
    return [self tutorialContentViewControllerWithIndex:currentIndex-1];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger currentIndex = ((TutorialContentViewController *) viewController).pageIndex;
    if (currentIndex == 0 || currentIndex == NSNotFound) {
        return nil;
    }
    return [self tutorialContentViewControllerWithIndex:currentIndex+1];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return 5;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

- (TutorialContentViewController *)tutorialContentViewControllerWithIndex:(NSUInteger)pageIndex
{
    TutorialContentViewController *tutorialContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"TutorialContentViewController"];
    tutorialContentViewController.pageIndex = pageIndex;
    return tutorialContentViewController;
}

@end
