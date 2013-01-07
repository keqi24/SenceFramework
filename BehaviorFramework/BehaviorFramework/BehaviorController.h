//
//  BehaviorController.h
//  BehaviorFramework
//
//  Created by user on 12-6-16.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constant.h"
#import "Strategy.h"
#import "SuperDeviceSence.h"
#import "RecordData.h"

@class SuperDeviceSence;



@interface BehaviorController : NSObject {
    @protected
    BOOL _isServer;
    NSString * _serverAddress;
    
    BOOL _isNative;
    
    NSString * _apiKey;
    
    BOOL _isCalculate;
    id<Strategy>  _strategy;
    
    SuperDeviceSence* _deviceSence;
}

@property(retain,readwrite,nonatomic) id<Strategy> strategy;
@property(retain,readwrite,nonatomic) SuperDeviceSence* deviceSence;


//单例方法
+(BehaviorController *) shareBehaviorController;

//设置server相关
-(void)setIsServer:(BOOL)isServer;
-(void)setServerAddress:(NSString *)address;

//本地化存储相关
-(void)setIsNative:(BOOL)isNative;
-(void)initSqlistWithRecordData:(RecordData*)record;

//设置DeviceSence



//开启session，初始化设置
-(void)startSession:(NSString *)apiKey;

//记录事件
-(void)logEvent:(NSString *)eventName;


//利用模型计算
-(void)setIsCalculate:(BOOL)isCalculate;
-(NSDictionary *)calulateWithRecord:(RecordData*)record;

@end
