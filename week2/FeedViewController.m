//
//  FeedViewController.m
//  week2
//
//  Created by Christine Chao on 6/14/14.
//  Copyright (c) 2014 Christine Chao. All rights reserved.
//

#import "FeedViewController.h"

@interface FeedViewController ()

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
    self.view.backgroundColor = [UIColor colorWithRed:211.0/255.0 green:214.0/255.0 blue:219.0/255.0 alpha:1];
    
    UIImage *statusBar = [UIImage  imageNamed:@"status_bar"];
    UIImageView *statusBarView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64, 320, 45)];
    statusBarView.image = statusBar;
    
    UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    indicatorView.center = CGPointMake(self.view.frame.size.width / 2, (self.view.frame.size.height + self.navigationController.navigationBar.frame.size.height + statusBarView.frame.size.height) / 2);
    [indicatorView startAnimating];
    
    [self.view addSubview:indicatorView];
    
    [self.view addSubview:statusBarView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
