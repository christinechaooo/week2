//
//  LogInTableViewController.m
//  week2
//
//  Created by Christine Chao on 6/11/14.
//  Copyright (c) 2014 Christine Chao. All rights reserved.
//

#import "LogInTableViewController.h"

@interface LogInTableViewController ()

@end

@implementation LogInTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIView *newView = [[UIView alloc]initWithFrame:CGRectMake(10, 70, 300, 45)];
    submit = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [submit setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //[submit setTitleColor:[UIColor colorWithWhite:0.0 alpha:0.56] forState:UIControlStateDisabled];
    [submit setTitle:@"Login" forState:UIControlStateNormal];
    [submit.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];
    [submit setFrame:CGRectMake(10.0, 15.0, 280.0, 44.0)];
    [newView addSubview:submit];
    
    [self.tableView setTableFooterView:newView];
    
    [super viewDidLoad];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
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
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
