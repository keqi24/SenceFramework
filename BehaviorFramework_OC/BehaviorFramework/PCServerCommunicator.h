//
//  PCServerCommunicator.h
//  AssetShow
//
//  Created by apple on 12-2-27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constant.h"
#import "RecordData.h"

@interface PCRequestPublicPara : NSObject

@property(nonatomic,readwrite) SEL selecor;
@property(nonatomic,readwrite,retain) id delegate;
@property(nonatomic,readwrite,retain) NSString * macAddress;

-(id) initWithDelegate:(id)delegate selector:(SEL)selector macAddress:(NSString *)mac;
+(id) PCRequestPublicParaWithDelegate:(id)delegate selector:(SEL)selector macAddress:(NSString *)mac;
+(id) PCRequestPublicParaWithDelegate:(id)delegate selector:(SEL)selector;

@end


@interface PCServerCommunicator : NSObject 

@property(readonly,retain,nonatomic) NSString * macAddress;


+(PCServerCommunicator *)shareServerCommnunicator;

-(void)sendEventWithRecordData:(RecordData*)record; 

-(void)sendEventWithRecordData:(RecordData*)record url:(NSString*)url macAddress:(NSString*) macAddress;


/**
 方法：获取当前位置信息
 参数：
 返回：位置信息相关字典
 */
//-(NSDictionary *) getPositionInfo;
/**
 方法：获取当前位置信息
 参数：公共参数
 返回：位置信息相关字典
 */
-(void)getPositionInfo:(PCRequestPublicPara *)publicPara;


@end
