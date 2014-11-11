//
//  JokeViewController.m
//  youWealkling
//
//  Created by fredhedz on 9/20/14.
//  Copyright (c) 2014 Freddy Hernandez Jr. All rights reserved.
//

#import "JokeViewController.h"

@interface JokeViewController ()

@property (strong, nonatomic) IBOutlet UILabel *jokeLabel;
@property BOOL adBannerIsVisible;
@property (strong, nonatomic) IBOutlet ADBannerView *adBannerView;

@end

@implementation JokeViewController

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
    UIFont *font = [UIFont systemFontOfSize:30];
    self.jokeLabel.font = font;
    self.jokeLabel.text = self.joke;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    self.adBannerView = [[ADBannerView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height, 320, 50)];
    self.adBannerView.delegate = self;
}

- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    if (!self.adBannerIsVisible) {
        if (self.adBannerView.superview == nil) {
            [self.view addSubview:self.adBannerView];
        }
        
        [UIView beginAnimations:@"animateAdBannerOn" context:NULL];
        
        self.adBannerView.frame = CGRectOffset(self.adBannerView.frame, 0, -self.adBannerView.frame.size.height);
        
        [UIView commitAnimations];
        
        self.adBannerIsVisible = YES;
    }
}

- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    NSLog(@"failed to retrieve ad");
    
    if (self.adBannerIsVisible) {
        [UIView beginAnimations:@"animatedAdBannerOff" context:NULL];
        
        self.adBannerView.frame = CGRectOffset(self.adBannerView.frame, 0, self.adBannerView.frame.size.height);
        
        [UIView commitAnimations];
        
        self.adBannerIsVisible = NO;
    }
}
- (IBAction)touchedDismissButton:(id)sender {
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
