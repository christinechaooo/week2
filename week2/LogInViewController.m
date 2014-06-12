//
//  LogInViewController.m
//  week2
//
//  Created by Christine Chao on 6/11/14.
//  Copyright (c) 2014 Christine Chao. All rights reserved.
//

#import "LogInViewController.h"

@interface LogInViewController ()
@property (strong, nonatomic) UITableView *tableView;
@end

@implementation LogInViewController

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
    
    UIColor *fbBlue = [UIColor colorWithRed:56.0/255.0 green:85.0/255.0 blue:144.0/255.0 alpha:1];
    self.view.backgroundColor = fbBlue;
    
    //Add FB logo
    UIImage *fbLogo = [UIImage  imageNamed:@"fb-logo"];
    UIImageView *fbLogoView = [[UIImageView alloc] initWithFrame:CGRectMake(75, 128, 167, 34)];
    fbLogoView.image = fbLogo;
    
    //Add login textfields
//    LogInTableViewController *logInTextFields = [[LogInTableViewController alloc] init];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(16, 217, 288, 88) style:UITableViewStylePlain];
    self.tableView.layer.cornerRadius = 4;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
//    UIView *newView = [[UIView alloc]initWithFrame:CGRectMake(10, 70, 300, 45)];
//    submit = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//    [submit setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    //[submit setTitleColor:[UIColor colorWithWhite:0.0 alpha:0.56] forState:UIControlStateDisabled];
//    [submit setTitle:@"Login" forState:UIControlStateNormal];
//    [submit.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];
//    [submit setFrame:CGRectMake(10.0, 15.0, 280.0, 44.0)];
//    [newView addSubview:submit];
//    
//    [self.tableView setTableFooterView:newView];
    
    [self.view addSubview:fbLogoView];
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        //self.tableView.contentOffset = CGPointMake( 10,  320);
        [self.tableView setContentInset:UIEdgeInsetsMake(50,0,0,0)];
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    if ([indexPath section] == 0) {
        username = [[UITextField alloc] initWithFrame:CGRectMake(110, 10, 185, 30)];
        username.adjustsFontSizeToFitWidth = YES;
        username.textColor = [UIColor blackColor];
        if ([indexPath row] == 0) {
            username.placeholder = @"example@gmail.com";
            username.keyboardType = UIKeyboardTypeEmailAddress;
            username.returnKeyType = UIReturnKeyNext;
            cell.textLabel.text = @"Username";
            username.clearButtonMode = YES;
        }
        else {
            username.placeholder = @"minimum 6 characters";
            username.keyboardType = UIKeyboardTypeDefault;
            username.returnKeyType = UIReturnKeyDone;
            username.secureTextEntry = YES;
            cell.textLabel.text = @"Password";
            username.clearButtonMode = UITextFieldViewModeAlways;
        }
        username.backgroundColor = [UIColor whiteColor];
        username.autocorrectionType = UITextAutocorrectionTypeNo; // no auto correction support
        username.autocapitalizationType = UITextAutocapitalizationTypeNone; // no auto capitalization support
        username.textAlignment = NSTextAlignmentLeft;
        username.tag = 0;
        
        
        username.clearButtonMode = UITextFieldViewModeAlways; // no clear 'x' button to the right
        [username setEnabled: YES];
        
        
        [cell.contentView addSubview: username];
        
    }
    
    // Configure the cell...
    
    return cell;}

@end
