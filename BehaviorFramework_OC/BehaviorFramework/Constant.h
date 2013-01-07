//
//  Constant.h
//  BehaviorFramework
//
//  Created by user on 12-6-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const EVENT_NOTIFICATION;
extern NSString * const NEXT_EVENT_NOTIFICATION;
extern NSString *const SERVER_URL;

#ifdef BF_RECORD_DATA
//#define BF_RECORD_DATA
typedef struct _recordData {
    NSDictionary * key;
    NSDictionary * parameters;
} RecordData;
#endif