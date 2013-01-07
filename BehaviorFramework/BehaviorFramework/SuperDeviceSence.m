//
//  SuperDeviceSence.m
//  BehaviorFramework
//
//  Created by user on 12-6-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SuperDeviceSence.h"

@implementation SuperDeviceSence  

-(id)initWithName:(NSString*)name {
    if (self = [super init]) {
        senceName = name;
    }
    return self;
}
    
-(void)setComponent:(SuperDeviceSence *)component {
    if (!senceComponent) {
        senceComponent = component;
    }
}

-(NSString*)singleSence {
    return nil;
}

-(id)allSences {
    id sences  = [senceComponent allSence];
    NSString * value = [self singleSence];
    NSDictionary* dictionary = nil;
    
    if (sences) {
        dictionary = (NSDictionary*)sences;
    } else {
        dictionary = [NSDictionary dictionary];
    }
    
    if (value) {
        
        [dictionary setValue:[self singleSence] forKey:senceName];
    }
    
    return dictionary;
}


@end
