//
//  ViewController.m
//  SukumarSqlite
//
//  Created by Naresh Kandala on 10/11/16.
//  Copyright © 2016 Naresh Kandala. All rights reserved.
//

#import "ViewController.h"
#import "DataBase.h"
#import "FMDatabase.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    DataBase *db = [[DataBase alloc]init];
    [ db  addDatamanager];

    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)saveData:(id)sender {
    DataBase *db = [[DataBase alloc]init];
    
    FMDatabase *fmDB = [FMDatabase databaseWithPath:[db insertDataBase]];
    [fmDB open];
    
    
    NSString *insertQuery_insert_Names = [NSString stringWithFormat:@"INSERT INTO Names (Names ) VALUES ('%@')",self.employeeName.text];
    NSString *insertQuery_Employee_Details = [NSString stringWithFormat:@"INSERT INTO EmployeeDetails ( EmpNames, Empid, Empphone ) VALUES ('%@','%@','%@')",self.employeeName.text,self.employeeID.text,self.employeeNumber.text];
    
    
 BOOL i =  [fmDB executeUpdate:insertQuery_Employee_Details];
    if (i==true) {
        NSLog(@"Inserted employee");
        
    }else
    {
        NSLog(@"error inserting employee  ");
        
    }
    
    BOOL j = [fmDB executeUpdate:insertQuery_insert_Names];
    
    if (j==true) {
        NSLog(@"Inserted names");
        
    }else
    {
        NSLog(@"error inserting names  ");
        
    }

   // @"CREATE TABLE Names (  Names TEXT )"
    
    [fmDB close];
    
}

- (IBAction)fetchData:(id)sender {
    
    
    
    
    DataBase *db = [[DataBase alloc]init];
    
    
    
    NSMutableArray *arr = [db GetAllDate];
    
    
    
    
    NSLog(@"fvjahv %@",arr);
    
//    FMDatabase *fmDB = [FMDatabase databaseWithPath:[db insertDataBase]];
//    
//    [fmDB open];
//    
//    NSString *insertQuery_fetch_Emp_Names = [NSString stringWithFormat:@"SELECT * FROM EmployeeDetails "];
//
//    
//     FMResultSet *resultSet =  [fmDB executeQuery:insertQuery_fetch_Emp_Names];
//    NSMutableArray *arr_total=[[NSMutableArray alloc]init];
//
//    if(resultSet)
//            {
//                while([resultSet next])
//                    NSLog(@"ber %@",resultSet);
//
//                NSString *str_name = [NSString stringWithFormat:@"%@",[resultSet stringForColumn:@"EmpNames" ]];
//                
//                NSString *str_id = [NSString stringWithFormat:@"%@",[resultSet stringForColumn:@"Empid" ]];
//                
//                NSString *str_phone = [NSString stringWithFormat:@"%@",[resultSet stringForColumn:@"Empphone" ]];
//
//                [arr_total addObject:str_name];
//                [arr_total addObject:str_id];
//                [arr_total addObject:str_phone];
//            }
//    NSLog(@"vassdv %@",arr_total);
//    
//    [fmDB close];

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
