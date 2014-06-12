//
//  LogInTableViewController.h
//  week2
//
//  Created by Christine Chao on 6/11/14.
//  Copyright (c) 2014 Christine Chao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LogInTableViewController : UITableViewController<UITableViewDelegate, UITableViewDataSource>
{
    UITextField *username;
    UIButton *submit;
}

@end
