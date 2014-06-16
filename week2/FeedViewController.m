//
//  FeedViewController.m
//  week2
//
//  Created by Christine Chao on 6/14/14.
//  Copyright (c) 2014 Christine Chao. All rights reserved.
//

#import "FeedViewController.h"

@interface FeedViewController ()

@property (nonatomic, strong) UIActivityIndicatorView *indicatorView;

- (void)showFeed;

@end

@implementation FeedViewController

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
    self.navigationItem.title = @"News Feed";
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"searchIcon"] style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"messageIcon"] style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    self.view.backgroundColor = [UIColor colorWithRed:211.0/255.0 green:214.0/255.0 blue:219.0/255.0 alpha:1];
    
    UIImage *statusBar = [UIImage  imageNamed:@"status_bar"];
    UIImageView *statusBarView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64, 320, 45)];
    statusBarView.image = statusBar;
    
    
//    UITabBarController *tabBarController = [[UITabBarController alloc] initWithFrame:CGRectMake(0, 524, 320, 44)];
    UITabBar *tabBar = [[UITabBar alloc] initWithFrame:CGRectMake(0, 524, 320, 44)];
    tabBar.delegate = self;
    [[UITabBar appearance] setTintColor:[UIColor colorWithRed:71.0/255.0 green:124.0/255.0 blue:230.0/255.0 alpha:1]];
//    tabBar.tabBarItem *firstButton = [[UITabBarItem alloc] initWithTitle:@"News Feed" image:[UIImage imageNamed:@"newsfeed"] selectedImage:[UIImage imageNamed:@"newsfeed-selected"]];
    NSMutableArray *tabBarItems = [[NSMutableArray alloc] init];
    
    UITabBarItem *tabBarItem1 = [[UITabBarItem alloc] initWithTitle:@"News Feed" image:[UIImage imageNamed:@"newsfeed"] tag:0];
    UITabBarItem *tabBarItem2 = [[UITabBarItem alloc] initWithTitle:@"Requests" image:[UIImage imageNamed:@"requests"] tag:1];
    UITabBarItem *tabBarItem3 = [[UITabBarItem alloc] initWithTitle:@"Messages" image:[UIImage imageNamed:@"messages"] tag:2];
    UITabBarItem *tabBarItem4 = [[UITabBarItem alloc] initWithTitle:@"Notifications" image:[UIImage imageNamed:@"notifications"] tag:3];
    UITabBarItem *tabBarItem5 = [[UITabBarItem alloc] initWithTitle:@"More" image:[UIImage imageNamed:@"more"] tag:4];
    
    tabBarItem1.titlePositionAdjustment = UIOffsetMake(0, -8.0);
    tabBarItem2.titlePositionAdjustment = UIOffsetMake(0, -8.0);
    tabBarItem3.titlePositionAdjustment = UIOffsetMake(0, -8.0);
    tabBarItem4.titlePositionAdjustment = UIOffsetMake(0, -8.0);
    tabBarItem5.titlePositionAdjustment = UIOffsetMake(0, -8.0);
    
    tabBarItem1.imageInsets = UIEdgeInsetsMake(-4, 0, 4, 0);
    tabBarItem2.imageInsets = UIEdgeInsetsMake(-4, 0, 4, 0);
    tabBarItem3.imageInsets = UIEdgeInsetsMake(-4, 0, 4, 0);
    tabBarItem4.imageInsets = UIEdgeInsetsMake(-4, 0, 4, 0);
    tabBarItem5.imageInsets = UIEdgeInsetsMake(-4, 0, 4, 0);
    
    [tabBarItems addObject:tabBarItem1];
    [tabBarItems addObject:tabBarItem2];
    [tabBarItems addObject:tabBarItem3];
    [tabBarItems addObject:tabBarItem4];
    [tabBarItems addObject:tabBarItem5];
    
    tabBar.items = tabBarItems;
    tabBar.selectedItem = [tabBarItems objectAtIndex:0];
    
    
    self.indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.indicatorView.center = CGPointMake(self.view.frame.size.width / 2, (self.view.frame.size.height + self.navigationController.navigationBar.frame.size.height + statusBarView.frame.size.height) / 2);
    [self.indicatorView startAnimating];
    
    [self performSelector:@selector(showFeed) withObject:self afterDelay:0.0 ];
    
    [self.view addSubview:self.indicatorView];
    [self.view addSubview:statusBarView];
    [self.view addSubview:tabBar];
}

- (void)showFeed {
    [self.indicatorView stopAnimating];
    
    UIScrollView *feedScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 109, 320, 414)];
    
    UIImage *feedImg = [UIImage  imageNamed:@"feed"];
    UIImageView *feedImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 1454)];
    feedImgView.image = feedImg;
    
    feedScrollView.contentSize = feedImgView.frame.size;
    
    [feedScrollView addSubview:feedImgView];
    [self.view addSubview:feedScrollView];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
