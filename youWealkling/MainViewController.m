//
//  MainViewController.m
//  youWealkling
//
//  Created by fredhedz on 9/30/14.
//  Copyright (c) 2014 Freddy Hernandez Jr. All rights reserved.
//

#import "MainViewController.h"
#import "ContentViewController.h"


@interface MainViewController ()

@property (nonatomic) NSArray *categoryIcons;
@property (nonatomic) NSArray *categoryLabels;
@property (strong, nonatomic) NSArray *tutorialImageFileNames;
@property (strong, nonatomic) NSArray *timeIntervalImages;
@property (strong, nonatomic) NSMutableArray *selectedIndexPaths;
@property (strong, nonatomic) IBOutlet UICollectionView *weaklingCollectionView;
@property (strong, nonatomic) UserOptions *userOptions;
@property (strong, nonatomic) QuotesManager *quotesManager;
@property (strong, nonatomic) IBOutlet UIButton *masterSwitch;
@property (strong, nonatomic) UIButton *exitButton;
@property (strong, nonatomic) IBOutlet UIPickerView *timePickerView;
@property (strong, nonatomic) UIView *exitButtonContainerView;
@property (strong, nonatomic) ContentViewController *tutorialViewController;

- (IBAction)touchedMasterSwitch:(UIButton *)sender;
- (IBAction)startTutorialButtonClicked:(UIButton *)sender;

@end

@implementation MainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.userOptions = [UserOptions new];
    self.quotesManager = [QuotesManager new];
    
    //images for time intervals
    self.timeIntervalImages = [NSArray arrayWithObjects:[UIImage imageNamed:@"30_minutes"], [UIImage imageNamed:@"1_hour"], [UIImage imageNamed:@"2_hours"], [UIImage imageNamed:@"3_hours"], [UIImage imageNamed:@"4_hours"], [UIImage imageNamed:@"5_hours"], [UIImage imageNamed:@"6_hours"], [UIImage imageNamed:@"7_hours"], [UIImage imageNamed:@"8_hours"], [UIImage imageNamed:@"9_hours"], [UIImage imageNamed:@"10_hours"], [UIImage imageNamed:@"11_hours"], [UIImage imageNamed:@"12_hours"], [UIImage imageNamed:@"24_hours"], nil];
    
    //images for tutorial pages
    self.tutorialImageFileNames = [NSArray arrayWithObjects:@"page1.png", @"page2.png", @"page3.png", @"page4.png", @"page5.png", nil];
    
    //set the image for the selected state of the masterswitch
    self.masterSwitch.selected = self.userOptions.notificationsEnabled;
    [self.masterSwitch setImage:[UIImage imageNamed:@"on_switch.png"] forState:UIControlStateSelected];
    
    //change the color of the UICollectionView
    self.weaklingCollectionView.backgroundColor = [UIColor whiteColor];
    
    //userOptions for selected categories
    self.selectedIndexPaths = [NSMutableArray new];
    
    //image objects for UICollectionView
    self.categoryIcons = [NSArray arrayWithObjects:[UIImage imageNamed:@"diet_icon.png"], [UIImage imageNamed:@"exercise_icon.png"], [UIImage imageNamed:@"creative_icon.png"], [UIImage imageNamed:@"life_icon.png"], [UIImage imageNamed:@"love_icon.png"], [UIImage imageNamed:@"study_icon.png"], nil];
    self.categoryLabels = [NSArray arrayWithObjects:[UIImage imageNamed:@"diet_label.png"], [UIImage imageNamed:@"exercise_label.png"], [UIImage imageNamed:@"creative_label.png"], [UIImage imageNamed:@"life_label.png"], [UIImage imageNamed:@"love_label.png"], [UIImage imageNamed:@"study_label.png"], nil];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:NO];
    
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.categoryIcons.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CategoryCell" forIndexPath:indexPath];
    UIImageView *categoryIcon = (UIImageView *)[cell viewWithTag:100];
    UIImageView *categoryLabel = (UIImageView *)[cell viewWithTag:101];
    UIImageView *checkmarkImage = (UIImageView *)[cell viewWithTag:102];
    
    
    categoryIcon.image = self.categoryIcons[indexPath.row];
    categoryLabel.image = self.categoryLabels[indexPath.row];
    //if the cell is selected then add a checkmark and a name label
    //if useroptions returns 1 for the row, then the icon should be checked
    switch (indexPath.row) {
        case 0:
            checkmarkImage.image = self.userOptions.diet ? [UIImage imageNamed:@"checkmark.png"] : nil;
//            categoryLabel.image = self.userOptions.diet ? self.categoryLabels[indexPath.row] : nil;
            break;
        case 1:
            checkmarkImage.image = self.userOptions.exercise ? [UIImage imageNamed:@"checkmark.png"] : nil;
//            categoryLabel.image = self.userOptions.exercise ? self.categoryLabels[indexPath.row] : nil;
            break;
        case 2:
            checkmarkImage.image = self.userOptions.creativity ? [UIImage imageNamed:@"checkmark.png"] : nil;
//            categoryLabel.image = self.userOptions.creativity ? self.categoryLabels[indexPath.row] : nil;
            break;
        case 3:
            checkmarkImage.image = self.userOptions.life ? [UIImage imageNamed:@"checkmark.png"] : nil;
//            categoryLabel.image = self.userOptions.life ? self.categoryLabels[indexPath.row] : nil;
            break;
        case 4:
            checkmarkImage.image = self.userOptions.love ? [UIImage imageNamed:@"checkmark.png"] : nil;
//            categoryLabel.image = self.userOptions.love ? self.categoryLabels[indexPath.row] : nil;
            break;
        case 5:
            checkmarkImage.image = self.userOptions.study ? [UIImage imageNamed:@"checkmark.png"] : nil;
//            categoryLabel.image = self.userOptions.study ? self.categoryLabels[indexPath.row] : nil;
            break;
        default:
            break;
    }
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
            self.userOptions.diet = !self.userOptions.diet;
            break;
        case 1:
            self.userOptions.exercise = !self.userOptions.exercise;
            break;
        case 2:
            self.userOptions.creativity = !self.userOptions.creativity;
            break;
        case 3:
            self.userOptions.life = !self.userOptions.life;
            break;
        case 4:
            self.userOptions.love = !self.userOptions.love;
            break;
        case 5:
            self.userOptions.study = !self.userOptions.study;
            break;
        default:
            break;
    }
    
    //add the index path to the userOptions
    if ([self.selectedIndexPaths containsObject:indexPath]) {
        [self.selectedIndexPaths removeObject:indexPath];
    }
    else {
        [self.selectedIndexPaths addObject:indexPath];
    }
    
    NSLog(@"selected %ld", (long)indexPath.row);
    [collectionView reloadData];
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat scale = .23;
    return CGSizeMake((scale*width), (scale*width));
}

#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 14;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 50;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    
    //30minutes, 1-12hr, 24hr
    UIImageView *timeView = [[UIImageView alloc] initWithImage:self.timeIntervalImages[row]];
//    UIImageView *timeView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 50)];
//    timeView.text = timePickerTitles[row];
//    [timeView setFont:[UIFont systemFontOfSize:25]];
    [timeView setFrame:CGRectMake(0, 0, 150, 25)];
    return timeView;
}


#pragma mark - UIPickerViewDelegate

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    switch (row) {
        case 0:
            NSLog(@"row %ld", (long)row);
            self.userOptions.notificationTimeInterval = 5;
            break;
        case 1:
            NSLog(@"row %ld", (long)row);
            self.userOptions.notificationTimeInterval = 60*60;
            break;
        case 2:
            NSLog(@"row %ld", (long)row);
            self.userOptions.notificationTimeInterval = 120*60;
            break;
        case 3:
            NSLog(@"row %ld", (long)row);
            self.userOptions.notificationTimeInterval = 180*60;
            break;
        case 4:
            NSLog(@"row %ld", (long)row);
            self.userOptions.notificationTimeInterval = 240*60;
            break;
        case 5:
            NSLog(@"row %ld", (long)row);
            self.userOptions.notificationTimeInterval = 300*60;
            break;
        case 6:
            NSLog(@"row %ld", (long)row);
            self.userOptions.notificationTimeInterval = 360*60;
            break;
        case 7:
            NSLog(@"row %ld", (long)row);
            self.userOptions.notificationTimeInterval = 420*60;
            break;
        case 8:
            NSLog(@"row %ld", (long)row);
            self.userOptions.notificationTimeInterval = 480*60;
            break;
        case 9:
            NSLog(@"row %ld", (long)row);
            self.userOptions.notificationTimeInterval = 540*60;
            break;
        case 10:
            NSLog(@"row %ld", (long)row);
            self.userOptions.notificationTimeInterval = 600*60;
            break;
        case 11:
            NSLog(@"row %ld", (long)row);
            self.userOptions.notificationTimeInterval = 660*60;
            break;
        case 12:
            NSLog(@"row %ld", (long)row);
            self.userOptions.notificationTimeInterval = 720*60;
            break;
        case 13:
            NSLog(@"row %ld", (long)row);
            self.userOptions.notificationTimeInterval = 1440*60;
            break;
        default:
            break;
    }
}

- (IBAction)touchedMasterSwitch:(UIButton *)sender
{
    self.userOptions.notificationsEnabled = !sender.isSelected ? YES : NO;
    self.masterSwitch.selected = self.userOptions.notificationsEnabled;
    NSLog(@"%d", self.userOptions.notificationsEnabled);
}

- (void)exitButtonClicked
{
    if (self.exitButton.enabled) {
        [self.exitButtonContainerView removeFromSuperview];
        [self.exitButton removeFromSuperview];
        [self.tutorialViewController.view removeFromSuperview];
        [self.tutorialViewController removeFromParentViewController];
    }
}

- (IBAction)startTutorialButtonClicked:(UIButton *)sender
{
//    CGFloat width = self.view.frame.size.width;

    self.exitButtonContainerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    [self.exitButtonContainerView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.exitButtonContainerView];
    
    //configure an exit button
    self.exitButton = [[UIButton alloc] initWithFrame:CGRectMake(self.exitButtonContainerView.frame.origin.x, self.exitButtonContainerView.frame.origin.y+20, self.exitButtonContainerView.frame.size.width, self.exitButtonContainerView.frame.size.height-20)];
    [self.exitButton setImage:[UIImage imageNamed:@"dismiss.png"] forState:UIControlStateNormal];
    [self.exitButtonContainerView addSubview:self.exitButton];
    self.exitButton.enabled = YES;
    [self.exitButton addTarget:self action:@selector(exitButtonClicked) forControlEvents:UIControlEventTouchUpInside];

    self.tutorialViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ContentViewController"];
    self.tutorialViewController.imageName = [NSString stringWithFormat:@"tutorial_page.png"];
    self.tutorialViewController.view.frame = CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height);
    
    /*
    //init pageviewcontroller
    self.pageViewController = [[UIPageViewController alloc ] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.pageViewController.dataSource = self;
    
    ContentViewController *startingViewController = [self viewControllerAtIndex:0];
    
    [self.pageViewController setViewControllers:@[startingViewController] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    self.pageViewController.view.frame = CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height-50);
    */
    [self addChildViewController:self.tutorialViewController];
    [self.tutorialViewController didMoveToParentViewController:self];
    [self.view addSubview:self.tutorialViewController.view];

}


- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger currentIndex = ((ContentViewController *) viewController).index;
    
    if (currentIndex == NSNotFound) {
        return nil;
    }
    currentIndex++;
    
    if (currentIndex == [self.tutorialImageFileNames count]) {
        return nil;
    }
    
    return [self viewControllerAtIndex:currentIndex];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger currentIndex = ((ContentViewController *) viewController).index;
    
    if (currentIndex == NSNotFound || currentIndex == 0) {
        return nil;
    }
    currentIndex--;
    
    return [self viewControllerAtIndex:currentIndex];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.tutorialImageFileNames count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

- (ContentViewController *)viewControllerAtIndex:(NSUInteger)index
{
    ContentViewController *contentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ContentViewController"];
    contentViewController.index = index;
    contentViewController.imageName = self.tutorialImageFileNames[index];
    return contentViewController;
}

- (void) resetPageViewController
{   
    [self.pageViewController.view removeFromSuperview];
    [self.pageViewController removeFromParentViewController];
    self.pageViewController = nil;
    [self becomeFirstResponder];
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
