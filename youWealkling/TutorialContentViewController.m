//
//  TutorialContentViewController.m
//  youWealkling
//
//  Created by fredhedz on 8/31/14.
//  Copyright (c) 2014 Freddy Hernandez Jr. All rights reserved.
//

#import "TutorialContentViewController.h"

@interface TutorialContentViewController ()

@property NSArray *imageFileNames;
@property NSString *currentImageFileName;
@property (strong, nonatomic) IBOutlet UIImageView *pageImage;

@end

@implementation TutorialContentViewController

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
    self.imageFileNames = [NSArray arrayWithObjects:@"page1.png", @"page2.png", @"page3.png", @"page4.png", @"page5.png", nil];
    self.currentImageFileName = self.imageFileNames[self.pageIndex];
    self.pageImage.image = [UIImage imageNamed:self.currentImageFileName];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidLoad];
    self.imageFileNames = [NSArray arrayWithObjects:@"page1.png", @"page2.png", @"page3.png", @"page4.png", @"page5.png", nil];
    self.currentImageFileName = self.imageFileNames[self.pageIndex];
    self.pageImage.image = [UIImage imageNamed:self.currentImageFileName];

}

@end
