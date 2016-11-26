//
//  ViewController.h
//  SukumarSqlite
//
//  Created by Naresh Kandala on 10/11/16.
//  Copyright © 2016 Naresh Kandala. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *employeeName;
@property (strong, nonatomic) IBOutlet UITextField *employeeID;
@property (strong, nonatomic) IBOutlet UITextField *employeeNumber;

- (IBAction)saveData:(id)sender;
- (IBAction)fetchData:(id)sender;

@end

