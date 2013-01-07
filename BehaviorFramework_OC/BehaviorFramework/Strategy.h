//
//  Strategy.h
//  BehaviorFramework
//
//  Created by user on 12-6-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Constant.h"
#import "RecordData.h"

@protocol Strategy <NSObject>

@required
-(id)initWithLocal:(id)model;
-(void)train;
-(NSDictionary *)calculateWithRecordData:(RecordData *)record;

@optional
-(void)retrain;
-(void)localModel;


@end
