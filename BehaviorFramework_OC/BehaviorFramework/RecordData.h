//
//  RecordData.h
//  BehaviorFramework
//
//  Created by user on 12-6-18.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RecordData : NSObject

@property(retain,readwrite,nonatomic)NSDictionary* key;
@property(retain,readwrite,nonatomic)NSDictionary* parameters;

@end
