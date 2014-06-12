//
//  LogInViewController.h
//  week2
//
//  Created by Christine Chao on 6/11/14.
//  Copyright (c) 2014 Christine Chao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LogInViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
{
    UITextField * username;
    UIButton * submit;
}
@end
