//
//  LogInViewController.m
//  week2
//
//  Created by Christine Chao on 6/11/14.
//  Copyright (c) 2014 Christine Chao. All rights reserved.
//

#import "LogInViewController.h"
#import "FeedViewController.h"
#import "MoreViewController.h"
#import "RequestsViewController.h"
#import "MessagesViewController.h"
#import "NotificationsViewController.h"

@interface LogInViewController ()

@property (nonatomic, retain) UIView *loginContainerVeiw;
@property (nonatomic, retain) UIView *otherButtonsView;
@property (nonatomic, retain) UITextField *emailTF;
@property (nonatomic, retain) UITextField *passwordTF;
@property (nonatomic, retain) UIButton *logInButton;
@property (nonatomic, strong) UIActivityIndicatorView *indicatorView;
@property (nonatomic, strong) UIAlertView *alertView;
@property (nonatomic, strong) UIColor *fbBlue;

- (void)willShowKeyboard:(NSNotification *)notification;
- (void)willHideKeyboard:(NSNotification *)notification;
- (void)hideKeyboard;
- (void)checkPassword;
- (void)onLogIn:(id)sender;
- (void)textFieldChanged:(UITextField *)textField;

@end

@implementation LogInViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willShowKeyboard:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willHideKeyboard:) name:UIKeyboardWillHideNotification object:nil];

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.loginContainerVeiw = [[UIView alloc] init];
    
    self.fbBlue = [UIColor colorWithRed:56.0/255.0 green:85.0/255.0 blue:144.0/255.0 alpha:1];
    self.view.backgroundColor = self.fbBlue;
    
    //Add FB logo
    UIImage *fbLogo = [UIImage  imageNamed:@"fb-logo"];
    UIImageView *fbLogoView = [[UIImageView alloc] initWithFrame:CGRectMake(75, 128, 167, 34)];
    fbLogoView.image = fbLogo;
    
    //Add login textfields
    UIView *logInTextFieldsBg = [[UIView alloc] initWithFrame:CGRectMake(16, 213, 288, 88)];
    
    UIImage *logInBg = [UIImage  imageNamed:@"logInBg"];
    UIImageView *logInBgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 288, 88)];
    logInBgView.image = logInBg;
    [logInTextFieldsBg addSubview:logInBgView];
    
    self.emailTF = [[UITextField alloc] initWithFrame:CGRectMake(34, 213, 270, 44)];
    self.emailTF.placeholder = @"Email or phone number";
    self.emailTF.font = [UIFont systemFontOfSize:14];
    self.emailTF.keyboardType = UIKeyboardTypeEmailAddress;
    self.emailTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.emailTF addTarget:self action:@selector(textFieldChanged:) forControlEvents:UIControlEventEditingChanged];
    
    self.passwordTF = [[UITextField alloc] initWithFrame:CGRectMake(34, 257, 270, 44)];
    self.passwordTF.placeholder = @"Password";
    self.passwordTF.font = [UIFont systemFontOfSize:14];
    self.passwordTF.secureTextEntry = YES;
    self.passwordTF.clearButtonMode = UITextFieldViewModeWhileEditing;
    [self.passwordTF addTarget:self action:@selector(textFieldChanged:) forControlEvents:UIControlEventEditingChanged];
    
    self.logInButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.logInButton.frame = CGRectMake(16, 309, 288, 44);
    self.logInButton.titleLabel.font = [UIFont systemFontOfSize:18];
    self.logInButton.layer.cornerRadius = 4;
    self.logInButton.backgroundColor = [UIColor colorWithWhite:1 alpha:0.1];
    self.logInButton.enabled = NO;
    [self.logInButton setTitle:@"Log In" forState:UIControlStateNormal];
    [self.logInButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.logInButton setTitleColor:[UIColor colorWithWhite:1 alpha:0.5] forState:UIControlStateDisabled];
    [self.logInButton addTarget:self action:@selector(onLogIn:) forControlEvents:UIControlEventTouchUpInside];
    
    self.indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    self.indicatorView.center = CGPointMake(280, 331);
    
    self.alertView = [[UIAlertView alloc] initWithTitle:@"Incorrect Password" message:@"The password you entered is incorrect. Please try again." delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
    
    self.otherButtonsView = [[UIView alloc] initWithFrame:CGRectMake(0, 464, 320, 200)];
    
    UIButton *signUpButton = [UIButton buttonWithType:UIButtonTypeCustom];
    signUpButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [signUpButton setTitle:@"Sign Up For Facebook" forState:UIControlStateNormal];
    [signUpButton sizeToFit];
    [signUpButton setCenter:CGPointMake(160, 22)];
    [signUpButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [signUpButton setTitleColor:[UIColor colorWithWhite:1 alpha:0.5] forState:UIControlStateHighlighted];
    
    UIButton *helpCenterButton = [UIButton buttonWithType:UIButtonTypeCustom];
    helpCenterButton.frame = CGRectMake(16, 44, 288, 44);
    helpCenterButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [helpCenterButton setTitle:@"Help Center" forState:UIControlStateNormal];
    [helpCenterButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [helpCenterButton setTitleColor:[UIColor colorWithWhite:1 alpha:0.5] forState:UIControlStateHighlighted];
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyboard)];
    [self.view addGestureRecognizer:tapRecognizer];
    
    [self.view addSubview:self.loginContainerVeiw];
    [self.view addSubview:self.otherButtonsView];
    [self.view addSubview:self.emailTF];
    [self.view addSubview:self.passwordTF];
    [self.view addSubview:self.indicatorView];
    
    [self.loginContainerVeiw addSubview:logInTextFieldsBg];
    [self.loginContainerVeiw addSubview:fbLogoView];
    [self.view addSubview:self.logInButton];
    
    [self.otherButtonsView addSubview:signUpButton];
    [self.otherButtonsView addSubview:helpCenterButton];
    
}

- (void)textFieldChanged:(UITextField *)textField {
    if (self.emailTF.text.length != 0 && self.passwordTF.text.length != 0) {
        self.logInButton.enabled = YES;
    } else {
        self.logInButton.enabled = NO;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)willShowKeyboard:(NSNotification *)notification {
    [UIView animateWithDuration:0.25f
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         self.loginContainerVeiw.frame = CGRectMake(0, -70, self.loginContainerVeiw.frame.size.width, self.loginContainerVeiw.frame.size.height);
                         self.otherButtonsView.frame = CGRectMake(0, 300, self.otherButtonsView.frame.size.width, self.otherButtonsView.frame.size.height);
                         self.emailTF.frame = CGRectMake(34, 143, self.emailTF.frame.size.width, self.emailTF.frame.size.height);
                         self.passwordTF.frame = CGRectMake(34, 187, self.passwordTF.frame.size.width, self.passwordTF.frame.size.height);
                         self.logInButton.frame = CGRectMake(16, 239, self.logInButton.frame.size.width, self.logInButton.frame.size.height);
                         self.indicatorView.frame = CGRectMake(270, 252, self.indicatorView.frame.size.width, self.indicatorView.frame.size.height);
                     }
                     completion:nil];
}

- (void)hideKeyboard {
    [self.view endEditing:YES];
}

- (void)onLogIn:(id)sender {
    NSLog(@"log in");
    [self.view endEditing:YES];
    [self.logInButton setTitle:@"Logging In" forState:UIControlStateNormal];
    [self.indicatorView startAnimating];
    [self performSelector:@selector(checkPassword) withObject:self afterDelay:2.0 ];
}

- (void)checkPassword {
    if([self.passwordTF.text isEqualToString:@"password"] == YES) {
        self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
        self.tabBarController = [[UITabBarController alloc] init];
        [[UITabBar appearance] setTintColor:[UIColor colorWithRed:71.0/255.0 green:124.0/255.0 blue:230.0/255.0 alpha:1]];
    
        FeedViewController *feedVC = [[FeedViewController alloc] init];
        UINavigationController *feedNVC = [[UINavigationController alloc] initWithRootViewController:feedVC];
        feedNVC.tabBarItem.title = @"News Feed";
        feedNVC.tabBarItem.image = [UIImage imageNamed:@"newsfeed"];
        feedNVC.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -6.0);
        feedNVC.tabBarItem.imageInsets = UIEdgeInsetsMake(-2, 0, 2, 0);
        feedNVC.navigationBar.barTintColor = self.fbBlue;
        feedNVC.navigationBar.tintColor = [UIColor whiteColor];
    
        RequestsViewController *requestsVC = [[RequestsViewController alloc] init];
        UINavigationController *requestsNVC = [[UINavigationController alloc] initWithRootViewController:requestsVC];
        requestsNVC.tabBarItem.title = @"Requests";
        requestsNVC.tabBarItem.image = [UIImage imageNamed:@"requests"];
        requestsNVC.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -6.0);
        requestsNVC.tabBarItem.imageInsets = UIEdgeInsetsMake(-2, 0, 2, 0);
        requestsNVC.navigationBar.barTintColor = self.fbBlue;
        requestsNVC.navigationBar.tintColor = [UIColor whiteColor];
    
        MessagesViewController *messagesVC = [[MessagesViewController alloc] init];
        UINavigationController *messagesNVC = [[UINavigationController alloc] initWithRootViewController:messagesVC];
        messagesNVC.tabBarItem.title = @"Messages";
        messagesNVC.tabBarItem.image = [UIImage imageNamed:@"messages"];
        messagesNVC.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -6.0);
        messagesNVC.tabBarItem.imageInsets = UIEdgeInsetsMake(-2, 0, 2, 0);
        messagesNVC.navigationBar.barTintColor = self.fbBlue;
        messagesNVC.navigationBar.tintColor = [UIColor whiteColor];
    
        NotificationsViewController *notificationsVC = [[NotificationsViewController alloc] init];
        UINavigationController *notificationsNVC = [[UINavigationController alloc] initWithRootViewController:notificationsVC];
        notificationsNVC.tabBarItem.title = @"Notifications";
        notificationsNVC.tabBarItem.image = [UIImage imageNamed:@"notifications"];
        notificationsNVC.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -6.0);
        notificationsNVC.tabBarItem.imageInsets = UIEdgeInsetsMake(-2, 0, 2, 0);
        notificationsNVC.navigationBar.barTintColor = self.fbBlue;
        notificationsNVC.navigationBar.tintColor = [UIColor whiteColor];
    
    
        MoreViewController *moreVC = [[MoreViewController alloc] init];
        UINavigationController *moreNVC = [[UINavigationController alloc] initWithRootViewController:moreVC];
        moreNVC.tabBarItem.title = @"More";
        moreNVC.tabBarItem.image = [UIImage imageNamed:@"more"];
        moreNVC.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -6.0);
        moreNVC.tabBarItem.imageInsets = UIEdgeInsetsMake(-2, 0, 2, 0);
        moreNVC.navigationBar.barTintColor = self.fbBlue;
        moreNVC.navigationBar.tintColor = [UIColor whiteColor];
    
        NSDictionary *navbarTitleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                               [UIColor whiteColor],NSForegroundColorAttributeName, nil];
    
        [[UINavigationBar appearance] setTitleTextAttributes:navbarTitleTextAttributes];
    
        NSArray *viewControllers = [[NSArray alloc] initWithObjects:
                                  feedNVC,requestsNVC, messagesNVC, notificationsNVC, moreNVC, nil];
    
        [self.tabBarController setViewControllers:viewControllers];
        self.window.rootViewController = self.tabBarController;
        [self.window makeKeyAndVisible];
        
//        [UIView transitionFromView:self.window.rootViewController.view
//                            toView:self.tabBarController.view
//                          duration:0.5
//                           options:UIViewAnimationOptionTransitionCrossDissolve
//                        completion:^(BOOL finished){ self.window.rootViewController = self.tabBarController; }];
        
    } else {
        [self.alertView show];
        [self.logInButton setTitle:@"Log In" forState:UIControlStateNormal];
        [self.indicatorView stopAnimating];
    }
    
}

- (void)willHideKeyboard:(NSNotification *)notification {
    [UIView animateWithDuration:0.25f
                          delay:0
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         self.loginContainerVeiw.frame = CGRectMake(0, 0, self.loginContainerVeiw.frame.size.width, self.loginContainerVeiw.frame.size.height);
                         self.otherButtonsView.frame = CGRectMake(0, 464, self.otherButtonsView.frame.size.width, self.otherButtonsView.frame.size.height);
                         self.emailTF.frame = CGRectMake(34, 213, self.emailTF.frame.size.width, self.emailTF.frame.size.height);
                         self.passwordTF.frame = CGRectMake(34, 257, self.passwordTF.frame.size.width, self.passwordTF.frame.size.height);
                         self.logInButton.frame = CGRectMake(16, 309, self.logInButton.frame.size.width, self.logInButton.frame.size.height);
                         self.indicatorView.frame = CGRectMake(270, 322, self.indicatorView.frame.size.width, self.indicatorView.frame.size.height);
                     }
                     completion:nil];
}

@end
