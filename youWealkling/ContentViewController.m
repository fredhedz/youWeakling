//
//  ContentViewController.m
//  youWealkling
//
//  Created by fredhedz on 9/30/14.
//  Copyright (c) 2014 Freddy Hernandez Jr. All rights reserved.
//

#import "ContentViewController.h"
#import "MainViewController.h"

@interface ContentViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;

@end

@implementation ContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.backgroundImageView.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    self.backgroundImageView.image = [UIImage imageNamed:self.imageName];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
