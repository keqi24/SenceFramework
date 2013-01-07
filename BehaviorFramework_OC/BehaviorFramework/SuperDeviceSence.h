//
//  SuperDeviceSence.h
//  BehaviorFramework
//
//  Created by user on 12-6-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SuperDeviceSence : NSObject {
    @protected
    SuperDeviceSence* senceComponent;
    NSString* senceName;
}

-(id)initWithName:(NSString*)name;
-(void)setComponent:(SuperDeviceSence *)component;
-(NSString *)singleSence;
-(id)allSences;

@end
