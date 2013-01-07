//
//  RecordDao.m
//  SQLiteSample
//
//  Created by wang xuefeng on 10-12-29.
//  Copyright 2010 www.5yi.com. All rights reserved.
//

#import "Record.h"
#import "RecordDao.h"
#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"

#define TABLE_NAME @"TbNote"

@implementation RecordDao


-(void)insertWithRecordData:(RecordData *)record {
    
    NSDictionary* key = record.key;
    NSDictionary* parameters = record.parameters;
    
    NSString* sql = [NSString stringWithString:@"INSERT INTO %@ ("];
    for (id name in [key allKeys]) {
        sql = [sql stringByAppendingString:(NSString*)name];
        sql = [sql stringByAppendingString:@","];
    }
    for (id name in [parameters allKeys]) {
        sql = [sql stringByAppendingString:(NSString*)name];
        sql = [sql stringByAppendingString:@","];
    }
    
    sql = [sql substringToIndex:([sql length]-1)];
     sql = [sql stringByAppendingString:@") VALIES ("];
    
    for (int i=0; i<[[key allKeys] count]+ [[parameters allKeys] count]; i++) {
        sql = [sql stringByAppendingString:@"?,"];
    }
    
    sql = [sql substringToIndex:([sql length]-1)];
    sql = [sql stringByAppendingString:@")"];
   
    
    NSLog(@"insert SQL :%@", sql );
    
    NSMutableArray* array = [NSArray arrayWithArray:[key allValues]];
    [array addObjectsFromArray:[parameters allValues]];

    
    
    [db executeQuery:sql withArgumentsInArray:array];
   
    if ([db hadError]) {
		NSLog(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
	}
}


// SELECT
-(NSMutableArray *)resultSet
{
	NSMutableArray *result = [[[NSMutableArray alloc] initWithCapacity:0] autorelease];
	
	FMResultSet *rs = [db executeQuery:[self SQL:@"SELECT * FROM %@" inTable:TABLE_NAME]];
	while ([rs next]) {
		Record *tr = [[Record alloc] initWithIndex:[rs intForColumn:@"id"]
											 Title:[rs stringForColumn:@"title"]
											  Body:[rs stringForColumn:@"body"]];
		[result addObject:tr];
		[tr release];
	}
	
	[rs close];
	
	return result;
}


// INSERT
-(void)insertWithTitle:(NSString *)title Body:(NSString *)body
{
	[db executeUpdate:[self SQL:@"INSERT INTO %@ (title, body) VALUES (?,?)" inTable:TABLE_NAME], title, body];
	if ([db hadError]) {
		NSLog(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
	}
}


// UPDATE
-(BOOL)updateAtIndex:(int)index Title:(NSString *)title Body:(NSString *)body
{
	BOOL success = YES;
	[db executeUpdate:[self SQL:@"UPDATE %@ SET title=?, body=? WHERE id=?" inTable:TABLE_NAME],
	                                    title, body, [NSNumber numberWithInt:index]];
	if ([db hadError]) {
		NSLog(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
		success = NO;
	}
	
	return success;
}


// DELETE
- (BOOL)deleteAtIndex:(int)index
{
	BOOL success = YES;
	[db executeUpdate:[self SQL:@"DELETE FROM %@ WHERE id = ?" inTable:TABLE_NAME], [NSNumber numberWithInt:index]];
	if ([db hadError]) {
		NSLog(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
		success = NO;
	}
	return success;
}



- (void)dealloc
{
	[super dealloc];
}

@end