//
//  TimeDeviceSence.m
//  BehaviorFramework
//
//  Created by user on 12-6-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TimeDeviceSence.h"

@implementation TimeDeviceSence 

-(id)initWithName:(NSString *)name {
    if (self = [super initWithName:@"time"]) {
        
    }
    return self;
}

-(NSString*) singleSence {
    return @"nowtime";
}


@end
