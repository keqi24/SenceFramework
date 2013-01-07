//
//  BehaviorController.m
//  BehaviorFramework
//
//  Created by user on 12-6-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "BehaviorController.h"
#include "Constant.h"
#include "SuperDeviceSence.h"
#import "Strategy.h"
#import "PCServerCommunicator.h"
#import "RecordData.h"

static BehaviorController* sm_pBehaviorController = nil;


@interface BehaviorController(Private)
-(void)connectToServerWithData:(id)data;
-(void)insertNativeWithData:(id)data;
-(RecordData*)getRecordData:(id)data;
@end

@implementation BehaviorController


@synthesize strategy = _strategy;
@synthesize deviceSence = _deviceSence;


#pragma -mark instanceMethod
+(BehaviorController *)shareBehaviorController {
    return sm_pBehaviorController != nil ? sm_pBehaviorController : [[self alloc] init];
}


-(id)init {
    if (self = [super init]) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(event_callback) name:EVENT_NOTIFICATION object:self];
    }
    return self;
}

#pragma -mark serverRelated
//设置server相关
-(void)setIsServer:(BOOL)isServer {
    _isServer = isServer;
}
-(void)setServerAddress:(NSString *)address {
    _serverAddress = address;
}
-(void)connectToServerWithData:(id)data {
    
}

//本地化存储相关
-(void)setIsNative:(BOOL)isNative {
    _isNative = isNative;
}

//开启session，初始化设置
-(void)startSession:(NSString *)apiKey {
    _apiKey = apiKey;
}


-(void)initSqlistWithRecordData:(RecordData*)record{
      
    
}


-(RecordData*) getRecordData:(id)data {
    NSString* name = (NSString*)((NSNotification*)data).object;
    NSDictionary* keyDic = [NSDictionary dictionaryWithObject:name forKey:@"event"];
    NSAssert(_deviceSence, @"deviceSence is nil");
    
    RecordData* rd = [[[RecordData alloc] init] autorelease];
    
    rd.key = keyDic;
    rd.parameters = [_deviceSence allSences];
    
    return rd;
    
}

-(void)event_callback:(NSNotification *)data {
 
    RecordData* rd = [self getRecordData:data];
    
    if (_isServer) {
        [self connectToServerWithData:rd];
    }
    if (_isNative) {
        [self insertNativeWithData:rd];
    } 
    
    if (_isCalculate) {
        NSDictionary* dic = [self calulateWithRecord:rd];
        [[NSNotificationCenter defaultCenter] postNotificationName:NEXT_EVENT_NOTIFICATION object:nil userInfo:dic];
    }
   
}
-(void)logEvent:(NSString *)eventName {
    [[NSNotificationCenter defaultCenter] postNotificationName:EVENT_NOTIFICATION object:eventName userInfo:nil];
}


-(void)setIsCalculate:(BOOL)isCalculate {
    _isCalculate = isCalculate;
}

-(NSDictionary *)calulateWithRecord:(RecordData*)record {
     NSAssert(_strategy, @"strategy is nil");
    return [self.strategy calculateWithRecordData:record];
}


-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObject:self];
}
@end
