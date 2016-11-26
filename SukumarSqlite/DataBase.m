
#import "DataBase.h"
#import "FMDatabase.h"

@implementation DataBase

-(void)addDatamanager{
    FMDatabase *db = [FMDatabase databaseWithPath:self.insertDataBase];
    [db open];
    [db close];

    
}

-(NSString *)insertDataBase
{
    NSFileManager *DBFileMAnager = [NSFileManager defaultManager];
    NSError *err;
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *DocumentDir = [paths objectAtIndex:0];
    NSString *dbpath = [DocumentDir stringByAppendingPathComponent:@"sukumar.sqlite"];
    
    BOOL success = [DBFileMAnager fileExistsAtPath:dbpath];
    
    if (!success) {
        NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Sample.sqlite"];
        success = [DBFileMAnager copyItemAtPath:defaultDBPath toPath:dbpath error:&err];
        if (!success) {
            
            NSLog(@"Failed to create writable DB. Error '%@'.", [err localizedDescription]);
            
        } else {
            
            NSLog(@"DB copied.");
            
        }
    }else {
        NSLog(@"DB exists, no need to copy.");
    }
    NSLog(@"dbpath%@",dbpath);
    
    FMDatabase *database = [FMDatabase databaseWithPath:dbpath];
    
    [database open];
    
    NSString *insertQuery_Names = @"CREATE TABLE Names (  Names TEXT )";
    
    NSString *insertQuery_Employee_Details = @"CREATE TABLE EmployeeDetails (  EmpNames TEXT,  Empid TEXT, Empphone TEXT )";

    
    [database executeUpdate:insertQuery_Names];
    [database executeUpdate:insertQuery_Employee_Details];

    [database close];

    
    return dbpath;
}


-(NSMutableArray *)GetAllDate
{
    DataBase *db = [[DataBase alloc]init];
    
    FMDatabase *fmDB = [FMDatabase databaseWithPath:[db insertDataBase]];
    
    [fmDB open];
    
    NSString *insertQuery_fetch_Emp_Names=[NSString stringWithFormat:@"SELECT * FROM EmployeeDetails"];
    
    
    FMResultSet *resultSet =  [fmDB executeQuery:insertQuery_fetch_Emp_Names];
    
    NSMutableArray *arr_total1=[[NSMutableArray alloc]init];

        
        while([resultSet next])
        {
    NSMutableArray *arr_total=[[NSMutableArray alloc]init];

        NSString *str_name = [NSString stringWithFormat:@"%@",[resultSet stringForColumn:@"EmpNames" ]];
        
        NSString *str_id = [NSString stringWithFormat:@"%@",[resultSet stringForColumn:@"Empid" ]];
        
        NSString *str_phone = [NSString stringWithFormat:@"%@",[resultSet stringForColumn:@"Empphone" ]];
        
        [arr_total addObject:str_name];
        [arr_total addObject:str_id];
        [arr_total addObject:str_phone];
        
            [arr_total1 addObject:arr_total];
            
    }
    
//    NSLog(@"vassdv %@",arr_total);
    NSLog(@"vereverv %@",arr_total1);

    [fmDB close];

    return arr_total1;
}

@end
