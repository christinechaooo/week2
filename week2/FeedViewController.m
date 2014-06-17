//
//  FeedViewController.m
//  week2
//
//  Created by Christine Chao on 6/14/14.
//  Copyright (c) 2014 Christine Chao. All rights reserved.
//

#import "FeedViewController.h"
#import "MoreViewController.h"

@interface FeedViewController ()

@property (nonatomic, strong) UIActivityIndicatorView *indicatorView;
@property (nonatomic, strong) MoreViewController *moreView;
@property (nonatomic, strong) UINavigationController *nvc;
@property (nonatomic, strong) UIRefreshControl *refreshControl;
@property (nonatomic, strong) UIAlertView *alertView;
@property (nonatomic, assign) BOOL refreshError;

- (void)showFeed;
- (void)handleRefresh:(id)sender;
- (void)endRefreshing;

@end

@implementation FeedViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setRefreshError:NO];
    self.navigationItem.title = @"News Feed";
        
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"searchIcon"] style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"messageIcon"] style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    self.view.backgroundColor = [UIColor colorWithRed:211.0/255.0 green:214.0/255.0 blue:219.0/255.0 alpha:1];
    
    UIImage *statusBar = [UIImage  imageNamed:@"status_bar"];
    UIImageView *statusBarView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64, 320, 45)];
    statusBarView.image = statusBar;
    
    self.alertView = [[UIAlertView alloc] initWithTitle:@"Refresh Error" message:@"Blah Blah!" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    
    self.indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.indicatorView.center = CGPointMake(self.view.frame.size.width / 2, (self.view.frame.size.height + self.navigationController.navigationBar.frame.size.height + statusBarView.frame.size.height) / 2);
    [self.indicatorView startAnimating];
    
    [self performSelector:@selector(showFeed) withObject:self afterDelay:2.0 ];
    
    [self.view addSubview:self.indicatorView];
    [self.view addSubview:statusBarView];
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
    
    self.refreshControl = [[UIRefreshControl alloc] init];
    [self.refreshControl addTarget:self action:@selector(handleRefresh:) forControlEvents:UIControlEventValueChanged];
    [feedScrollView addSubview:self.refreshControl];

}

- (void)handleRefresh:(id)sender {
    [self performSelector:@selector(endRefreshing) withObject:self afterDelay:2.0 ];
    
}

- (void)endRefreshing {
    if(self.refreshError == YES) {
        [self.alertView show];
        [self setRefreshError:NO];
    } else {
        [self setRefreshError:YES];
    }
    [self.refreshControl endRefreshing];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
