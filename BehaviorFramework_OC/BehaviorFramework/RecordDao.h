//
//  RecordDao.h
//  SQLiteSample
//
//  Created by wang xuefeng on 10-12-29.
//  Copyright 2010 www.5yi.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseDao.h"
#import "RecordData.h"


@interface RecordDao : BaseDao {
}

-(NSMutableArray *)resultSet;

-(void)insertWithRecordData:(RecordData*) record;
-(BOOL)updateWithIndex:(int)index RecordData:(RecordData*) record;
-(BOOL)deleteAtIndex:(int)index;

@end
