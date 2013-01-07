//
//  RecordBean.h
//  BehaviorFramework
//
//  Created by user on 12-6-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RecordData.h"

@interface RecordBean : NSObject {
    int index;
    RecordData* _record;
}

@property(assign,readwrite,nonatomic) RecordData* record;

@end
